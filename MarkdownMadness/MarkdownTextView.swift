import SwiftUI

struct MarkdownTextView: View, Renderable {
    var markdown: String
    
    func renderMarkdown() -> NSAttributedString {
        // Implement Markdown rendering logic here
        let attributedString = NSMutableAttributedString(string: markdown)
        
        // Apply styles, parse Markdown, etc.
        // Example:
        attributedString.addAttribute(.foregroundColor, value: UIColor.black, range: NSRange(location: 0, length: attributedString.length))
        
        return attributedString
    }
    
    var body: some View {
        Text(renderMarkdown().string)
            .padding()
    }
}

