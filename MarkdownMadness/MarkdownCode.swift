import SwiftUI

struct MarkdownCodeView: View {
    var markdown: String

    func renderMarkdown() -> some View {
        let markdownLines = markdown.split(separator: "\n").map { String($0) }
        return Group {
            ForEach(markdownLines, id: \.self) { line in
                if line.starts(with: "```") {
                    Text(line.dropFirst(3))
                        .font(.custom("Courier", size: 16))
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
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

struct MarkdownCodeView_Previews: PreviewProvider {
    static var previews: some View {
        MarkdownCodeView(markdown: """
        ```
        let x = 10
        let y = 20
        print(x + y)
        ```
        """)
    }
}
