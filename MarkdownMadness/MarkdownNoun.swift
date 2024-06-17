import SwiftUI

struct MarkdownNoun {
    let text: String

    func render() -> Text {
        Text(text)
            .font(.headline)
            .fontWeight(.bold)
            .foregroundColor(.green)
            // Add more styling as needed
    }
}

struct MarkdownNoun_Previews: PreviewProvider {
    static var previews: some View {
        MarkdownNoun(text: "apple")
            .render()
            .padding()
    }
}
