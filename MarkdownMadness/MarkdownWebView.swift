import SwiftUI
import WebKit

struct MarkdownWebView: UIViewRepresentable {
    var markdown: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let html = convertMarkdownToHTML(markdown)
        uiView.loadHTMLString(html, baseURL: nil)
    }

    private func convertMarkdownToHTML(_ markdown: String) -> String {
        // Implement Markdown to HTML conversion
        // For simplicity, we'll use basic HTML tags. In a real implementation, you might use a Markdown parser.
        var html = markdown
        html = html.replacingOccurrences(of: "# ", with: "<h1>")
        html = html.replacingOccurrences(of: "\n", with: "<br>")
        html = html.replacingOccurrences(of: "- ", with: "<li>")
        html = html.replacingOccurrences(of: "```", with: "<pre><code>")
        html = html.replacingOccurrences(of: "[", with: "<a href='")
        html = html.replacingOccurrences(of: "](", with: "'>")
        html = html.replacingOccurrences(of: ")", with: "</a>")
        return "<html><body>\(html)</body></html>"
    }
}

struct MarkdownWebView_Previews: PreviewProvider {
    static var previews: some View {
        MarkdownWebView(markdown: "# Heading\n\nThis is a body text.\n\n- List item\n\n```\nCode block\n```\n\n[Link](http://example.com)")
    }
}
