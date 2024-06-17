import SwiftUI
import UIKit

struct MarkdownLabel: UIViewRepresentable {
    var markdown: String

    var headingStyle: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: 24)]
    var bodyStyle: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 16)]
    var codeStyle: [NSAttributedString.Key: Any] = [.font: UIFont.monospacedSystemFont(ofSize: 16, weight: .regular)]
    var linkStyle: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.blue]
    var listStyle: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 16)]
    var enableSyntaxHighlighting: Bool = true
    var enableImageRendering: Bool = true
    var enableLinkHandling: Bool = true

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .clear
        textView.attributedText = renderMarkdown()
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.attributedText = renderMarkdown()
    }

    func renderMarkdown() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: markdown)
        return applyStyles(to: attributedString)
    }

    func applyStyles(to attributedString: NSAttributedString) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(attributedString: attributedString)
        
        let lines = markdown.split(separator: "\n")
        var offset = 0
        for line in lines {
            let nsLine = line as NSString
            let range = NSRange(location: offset, length: nsLine.length)
            if line.starts(with: "#") {
                mutableAttributedString.addAttributes(headingStyle, range: range)
            } else if line.starts(with: "- ") {
                mutableAttributedString.addAttributes(listStyle, range: range)
            } else if line.contains("```") {
                mutableAttributedString.addAttributes(codeStyle, range: range)
            } else if line.contains("[") && line.contains("](") {
                let linkText = line.components(separatedBy: "](")[0].replacingOccurrences(of: "[", with: "")
                let linkURL = line.components(separatedBy: "](")[1].replacingOccurrences(of: ")", with: "")
                let linkRange = (nsLine.range(of: linkText))
                mutableAttributedString.addAttributes(linkStyle, range: linkRange)
                mutableAttributedString.addAttribute(.link, value: linkURL, range: linkRange)
            } else {
                mutableAttributedString.addAttributes(bodyStyle, range: range)
            }
            offset += nsLine.length + 1 // +1 for the newline character
        }
        
        return mutableAttributedString
    }
}

struct MarkdownLabel_Previews: PreviewProvider {
    static var previews: some View {
        MarkdownLabel(markdown: "# Heading\n\nThis is a body text.\n\n- List item\n\n```\nCode block\n```\n\n[Link](http://example.com)")
    }
}
