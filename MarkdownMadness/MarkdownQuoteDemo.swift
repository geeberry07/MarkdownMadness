import SwiftUI

struct MarkdownQuoteView: View {
    let text: String

    var body: some View {
        if text.starts(with: ">") {
            VStack(alignment: .leading, spacing: 8) {
                Text("Quote:")
                    .font(.headline)
                    .foregroundColor(.green)
                Text(text.dropFirst().trimmingCharacters(in: .whitespacesAndNewlines))
                    .font(.body)
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(8)
            }
            .padding()
        } else {
            Text(text)
                .font(.body)
                .padding()
        }
    }
}

struct MarkdownQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(spacing: 16) {
                MarkdownQuoteView(text: "> This is a block quote.")
                MarkdownQuoteView(text: "Regular text with no block quote.")
                MarkdownQuoteView(text: "> Multiple\n> lines\n> block quote.")
            }
            .padding()
        }
    }
}
