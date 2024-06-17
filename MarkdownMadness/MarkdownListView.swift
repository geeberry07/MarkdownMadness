import SwiftUI

struct MarkdownListView: View {
    var markdown: String

    func renderMarkdown() -> some View {
        let markdownLines = markdown.split(separator: "\n").map { String($0) }
        return Group {
            ForEach(markdownLines, id: \.self) { line in
                if line.starts(with: "- ") {
                    HStack {
                        Text("•")
                            .font(.body)
                            .padding(.trailing, 4)
                        Text(line.dropFirst(2))
                            .font(.body)
                    }
                    .padding(.leading, 20)
                } else if let range = line.range(of: "^\\d+\\. ", options: .regularExpression) {
                    let number = line[range].dropLast(2)
                    HStack {
                        Text("\(number).")
                            .font(.body)
                            .padding(.trailing, 4)
                        Text(line.dropFirst(range.upperBound.utf16Offset(in: line)))
                            .font(.body)
                    }
                    .padding(.leading, 20)
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

struct MarkdownListView_Previews: PreviewProvider {
    static var previews: some View {
        MarkdownListView(markdown: """
        - Unordered list item 1
        - Unordered list item 2
        1. Ordered list item 1
        2. Ordered list item 2
        """)
    }
}
