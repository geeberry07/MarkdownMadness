import SwiftUI

struct MarkdownSentence {
    let text: String

    func render() -> Text {
        Text(text)
            .font(.body)
            .foregroundColor(.black)
    }
}

struct MarkdownSentence_Previews: PreviewProvider {
    static var previews: some View {
        MarkdownSentence(text: "This is a *Markdown* sentence.")
            .render()
            .padding()
    }
}
