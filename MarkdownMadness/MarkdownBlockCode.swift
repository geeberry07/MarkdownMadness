import SwiftUI

struct MarkdownBlockCode: View {
    let text: String

    var body: some View {
        if text.hasPrefix("```") && text.hasSuffix("```") {
            let codeLines = text.components(separatedBy: "\n")
            let code = codeLines.dropFirst().dropLast().joined(separator: "\n")
            
            return ScrollView {
                Text(code)
                    .font(.system(.body, design: .monospaced))
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .lineLimit(nil) // Allow unlimited lines
            }
            .padding()
            .eraseToAnyView() // Convert ScrollView to AnyView to match opaque return type 'some View'
        } else {
            return Text(text)
                .font(.body)
                .padding()
                .eraseToAnyView() // Convert Text to AnyView to match opaque return type 'some View'
        }
    }
}

extension View {
    func eraseToAnyView() -> AnyView {
        return AnyView(self)
    }
}

struct MarkdownBlockCode_Previews: PreviewProvider {
    static var previews: some View {
        MarkdownBlockCode(text: """
        ```
        let greeting = "Hello, World!"
        print(greeting)
        ```
        """)
    }
}
