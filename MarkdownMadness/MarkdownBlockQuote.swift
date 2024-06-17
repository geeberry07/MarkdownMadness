import SwiftUI

struct MarkdownBlockQuote: View {
    let text: String

    var body: some View {
        if text.starts(with: "> ") {
            let quoteText = text.dropFirst(2).trimmingCharacters(in: .whitespaces)
            return VStack(alignment: .leading, spacing: 4) {
                Text(quoteText)
                    .italic()
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                Spacer()
            }
            .padding(.horizontal)
            .eraseToAnyView() // Convert VStack to AnyView to match opaque return type 'some View'
        } else {
            return Text(text)
                .font(.body)
                .padding()
                .eraseToAnyView() // Convert Text to AnyView to match opaque return type 'some View'
        }
    }
}


struct MarkdownBlockQuote_Previews: PreviewProvider {
    static var previews: some View {
        MarkdownBlockQuote(text: "> This is a blockquote.")
    }
}
