import SwiftUI

struct MarkdownHeaderRenderer: View {
    let text: String

    var body: some View {
        if text.starts(with: "#") {
            Text(text.drop(while: { $0 == "#" }).trimmingCharacters(in: .whitespaces))
                .font(.largeTitle)
                .bold()
        } else if text.starts(with: "##") {
            Text(text.drop(while: { $0 == "#" }).trimmingCharacters(in: .whitespaces))
                .font(.title)
                .bold()
        } else if text.starts(with: "###") {
            Text(text.drop(while: { $0 == "#" }).trimmingCharacters(in: .whitespaces))
                .font(.headline)
                .bold()
        } else {
            Text(text.trimmingCharacters(in: .whitespaces))
                .font(.body)
        }
    }
}

struct MarkdownHeaderRenderer_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 16) {
            MarkdownHeaderRenderer(text: "# Main Header")
            MarkdownHeaderRenderer(text: "## Subheader")
            MarkdownHeaderRenderer(text: "### Sub-subheader")
            MarkdownHeaderRenderer(text: "Regular text")
        }
        .padding()
    }
}
