import SwiftUI

struct MarkdownInlineCodeView: View {
    let text: String

    var body: some View {
        if text.contains("`") {
            let parts = text.components(separatedBy: "`")
            ForEach(0..<parts.count, id: \.self) { index in
                if index % 2 == 0 {
                    Text(parts[index])
                        .font(.body)
                } else {
                    Text(parts[index])
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(.horizontal, 4)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(4)
                }
            }
        } else {
            Text(text)
                .font(.body)
        }
    }
}

struct MarkdownInlineCodeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 16) {
            MarkdownInlineCodeView(text: "This is `inline code` example.")
            MarkdownInlineCodeView(text: "`code` and `more code` examples.")
            MarkdownInlineCodeView(text: "No inline code in this text.")
        }
        .padding()
    }
}
