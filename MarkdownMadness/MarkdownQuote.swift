import SwiftUI

struct MarkdownQuote: View {
    var markdown: String

    func renderMarkdown() -> some View {
        let markdownLines = markdown.split(separator: "\n").map { String($0) }
        return Group {
            ForEach(markdownLines, id: \.self) { line in
                if line.starts(with: "> ") {
                    HStack {
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 4)
                        Text(line.dropFirst(2))
                            .font(.body)
                            .padding(.leading, 8)
                    }
                    .padding(.vertical, 4)
                } else {
                    Text(line)
                        .font(.body)
                }
                Text("\n")
            }
        }
    }

    var body: some View {
        ScrollView {
            renderMarkdown()
                .padding()
        }
        .background(Color.secondary.opacity(0.1))
        .cornerRadius(8)
        .padding()
    }
}

struct MarkdownQuote_Previews: PreviewProvider {
    static var previews: some View {
        MarkdownQuote(markdown: """
        > This is a block quote.
        > It can span multiple lines.
        """)
    }
}
