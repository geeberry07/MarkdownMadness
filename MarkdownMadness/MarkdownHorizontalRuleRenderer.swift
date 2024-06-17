import SwiftUI

struct MarkdownHorizontalRuleRenderer: View {
    let text: String

    var body: some View {
        if text.trimmingCharacters(in: .whitespaces) == "---" ||
           text.trimmingCharacters(in: .whitespaces) == "***" {
            Divider()
                .padding()
        } else {
            Text(text)
                .font(.body)
                .padding()
        }
    }
}

struct MarkdownHorizontalRuleRenderer_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 16) {
            MarkdownHorizontalRuleRenderer(text: "---")
            MarkdownHorizontalRuleRenderer(text: "***")
            MarkdownHorizontalRuleRenderer(text: "Regular text")
        }
        .padding()
    }
}
