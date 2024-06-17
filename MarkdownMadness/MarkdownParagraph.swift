import SwiftUI

struct MarkdownParagraph: View {
    var body: some View {
            VStack(alignment: .leading, spacing: 16) {
                MarkdownSentence(text: "This is a *Markdown* sentence.")
                    .render()
                
                MarkdownSentence(text: "This is a *Markdown* sentence.")                    .render()
                
                MarkdownSentence(text: "This is a *Markdown* sentence.")                    .render()
                
                MarkdownSentence(text: "This is a *Markdown* sentence.")                    .render()
            }
            .padding()
        }
    }


struct MarkdownParagraph_Previews: PreviewProvider {
    static var previews: some View {
        MarkdownParagraph()
    }
}
