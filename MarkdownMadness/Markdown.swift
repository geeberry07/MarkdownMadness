import SwiftUI

struct MarkdownRenderer: View {
    var markdown: String

    func renderMarkdown() -> some View {
        let markdownLines = markdown.split(separator: "\n").map { String($0) }
        return Group {
            ForEach(markdownLines, id: \.self) { line in
                if line.starts(with: "# ") {
                    Text(line.dropFirst(2))
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 8)
                } else if line.starts(with: "## ") {
                    Text(line.dropFirst(3))
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top, 6)
                } else if line.starts(with: "### ") {
                    Text(line.dropFirst(4))
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.top, 4)
                } else if line.starts(with: "#### ") {
                    Text(line.dropFirst(5))
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.top, 2)
                } else if line.starts(with: "- ") {
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
                } else if line.starts(with: "```") {
                    Text(line.dropFirst(3))
                        .font(.custom("Courier", size: 16))
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                        .padding(.vertical, 4)
                } else if line.starts(with: "> ") {
                    HStack {
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 4)
                        Text(line.dropFirst(2))
                            .font(.body)
                            .padding(.leading, 8)
                    }
                    .padding(.vertical, 4)
                } else if line.contains("![") && line.contains("](") {
                    let parts = line.components(separatedBy: "](")
                    let imageUrl = parts[1].replacingOccurrences(of: ")", with: "")
                    MarkdownImageView(imageUrl: imageUrl)
                        .padding(.vertical, 4)
                } else if line.contains("[") && line.contains("](") {
                    let parts = line.components(separatedBy: "](")
                    let linkText = parts[0].replacingOccurrences(of: "[", with: "")
                    let linkURL = parts[1].replacingOccurrences(of: ")", with: "")
                    Text(linkText)
                        .foregroundColor(.blue)
                        .underline()
                        .onTapGesture {
                            guard let url = URL(string: linkURL) else { return }
                            UIApplication.shared.open(url)
                        }
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

struct MarkdownRenderer_Previews: PreviewProvider {
    static var previews: some View {
        MarkdownRenderer(markdown: """
        # Heading 1
        ## Heading 2
        ### Heading 3
        #### Heading 4

        - Unordered list item 1
        - Unordered list item 2

        1. Ordered list item 1
        2. Ordered list item 2

        ```
        Code block
        ```

        > Block quote

        ![Image](https://example.com/image.png)

        [Link](http://example.com)
        """)
    }
}
