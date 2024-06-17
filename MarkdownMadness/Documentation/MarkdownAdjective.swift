import SwiftUI

struct MarkdownAdjective {
    let text: String

    func render() -> Text {
        Text(text)
            .font(.body)
            .italic()
            .foregroundColor(.blue)
            // Add more styling as needed
    }
}

struct MarkdownAdjective_Previews: PreviewProvider {
    static var previews: some View {
        MarkdownAdjective(text: "beautiful")
            .render()
            .padding()
    }
}
