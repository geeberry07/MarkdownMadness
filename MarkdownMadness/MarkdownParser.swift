import Foundation

struct MarkdownParser: Hashable {
    enum MarkdownToken: Hashable {
        case heading(level: Int, text: String)
        case paragraph(text: String)
        case list(items: [String])
        case codeBlock(text: String)
        case text(String)
    }
    
    static func parse(markdown: String) -> [MarkdownToken] {
        var tokens: [MarkdownToken] = []
        
        let lines = markdown.components(separatedBy: .newlines)
        
        var currentParagraph = ""
        var currentListItems: [String] = []
        var inCodeBlock = false
        
        for line in lines {
            if line.starts(with: "# ") {
                // Heading
                let level = line.components(separatedBy: "#").count - 1
                let text = String(line.dropFirst(level + 1)).trimmingCharacters(in: .whitespacesAndNewlines)
                tokens.append(.heading(level: level, text: text))
            } else if line.starts(with: "- ") {
                // List item
                let item = String(line.dropFirst(2)).trimmingCharacters(in: .whitespacesAndNewlines)
                currentListItems.append(item)
            } else if line.starts(with: "```") {
                // Code block
                if inCodeBlock {
                    tokens.append(.codeBlock(text: currentParagraph))
                    currentParagraph = ""
                    inCodeBlock = false
                } else {
                    inCodeBlock = true
                }
            } else {
                // Regular text or continuation of previous list
                if currentListItems.isEmpty {
                    currentParagraph += line + "\n"
                } else {
                    currentListItems.append(line)
                }
            }
        }
        
        // Append remaining paragraph or list items
        if !currentParagraph.isEmpty {
            tokens.append(.paragraph(text: currentParagraph))
        }
        if !currentListItems.isEmpty {
            tokens.append(.list(items: currentListItems))
        }
        
        return tokens
    }
}
