import SwiftUI

struct MarkdownListRenderer: View {
    let text: String

    var body: some View {
        if text.starts(with: "- ") || text.starts(with: "* ") || text.starts(with: "+ ") {
            HStack(alignment: .top, spacing: 8) {
                Image(systemName: "circle")
                    .foregroundColor(.blue)
                Text(text.dropFirst(2).trimmingCharacters(in: .whitespaces))
                    .font(.body)
                    .padding(.leading, 4)
                Spacer()
            }
        } else if let index = text.firstIndex(of: ".") {
            let number = text.prefix(upTo: index)
            let rest = text.suffix(from: index).dropFirst().trimmingCharacters(in: .whitespaces)
            HStack(alignment: .top, spacing: 8) {
                Text("\(number).")
                    .font(.body)
                Text(rest)
                    .font(.body)
                    .padding(.leading, 4)
                Spacer()
            }
        } else {
            Text(text.trimmingCharacters(in: .whitespaces))
                .font(.body)
                .padding()
        }
    }
    
}

struct MarkdownListRenderer_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 16) {
            MarkdownListRenderer(text: "- Unordered list item 1")
            MarkdownListRenderer(text: "- Unordered list item 2")
            MarkdownListRenderer(text: "1. Ordered list item 1")
            MarkdownListRenderer(text: "2. Ordered list item 2")
            MarkdownListRenderer(text: "Regular text")
        }
        .padding()
    }
}
