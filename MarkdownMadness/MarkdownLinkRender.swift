import SwiftUI

struct MarkdownLinkRenderer: View {
    let text: String

    var body: some View {
        Group {
            if let linkRange = text.range(of: "\\[.*?\\]\\(.*?\\)", options: .regularExpression) {
                let startIndex = text.index(after: linkRange.lowerBound)
                let endIndex = text.index(before: linkRange.upperBound)
                let linkText = String(text[startIndex..<endIndex])
                let parts = linkText.components(separatedBy: "](")
                let linkDisplayText = parts.first ?? ""
                let linkUrl = parts.count > 1 ? String(parts[1].dropLast()) : ""

                Button(action: {
                    guard let url = URL(string: linkUrl) else { return }
                    UIApplication.shared.open(url)
                }) {
                    Text(linkDisplayText)
                        .foregroundColor(.blue)
                        .underline()
                }
                .padding()
            } else {
                Text(text)
                    .font(.body)
                    .padding()
            }
        }
    }
}

struct MarkdownLinkRenderer_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 16) {
            MarkdownLinkRenderer(text: "[Google](https://www.google.com)")
            MarkdownLinkRenderer(text: "[Apple](https://www.apple.com)")
            MarkdownLinkRenderer(text: "No links in this text.")
        }
        .padding()
    }
}
