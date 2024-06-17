import SwiftUI

struct MarkdownCodeBlockView: View {
    let text: String

    var body: some View {
        if text.contains("```") {
            let parts = text.components(separatedBy: "```")
            ForEach(0..<parts.count, id: \.self) { index in
                if index % 2 != 0 {
                    let code = parts[index]
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Code Block:")
                            .font(.headline)
                            .foregroundColor(.blue)
                        Text(code)
                            .font(.system(.body, design: .monospaced))
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                    }
                    .padding()
                } else {
                    Text(parts[index])
                        .font(.body)
                        .padding()
                }
            }
        } else {
            Text(text)
                .font(.body)
                .padding()
        }
    }
}

struct MarkdownCodeBlockView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(spacing: 16) {
                MarkdownCodeBlockView(text: "Regular text with no code blocks.")
                MarkdownCodeBlockView(text: "```swift\nfunc helloWorld() {\n    print(\"Hello, World!\")\n}\n```")
                MarkdownCodeBlockView(text: "Some text before\n```python\nprint(\"Hello, Python!\")\n```And some text after.")
            }
            .padding()
        }
    }
}
