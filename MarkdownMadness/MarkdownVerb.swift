import SwiftUI

struct MarkdownVerb {
    let text: String

    func render() -> Text {
        Text(text)
            .font(.body)
            .foregroundColor(.purple)
            // Add more styling as needed
    }
}

struct MarkdownVerb_Previews: PreviewProvider {
    static var previews: some View {
        MarkdownVerb(text: "running")
            .render()
            .padding()
    }
}
