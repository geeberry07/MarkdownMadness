import SwiftUI

struct Markdown {
    
    let markdown: String
    
    func render() -> some View {
        let tokens = MarkdownParser.parse(markdown: markdown)
        
        return ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                ForEach(tokens, id: \.self) { token in
                    switch token {
                    case .text(let text):
                        Text(text)
                            .font(.body)
                            .foregroundColor(.black)
                            .padding(.bottom, 4)
                    case .heading(let level, let text):
                        switch level {
                        case 1:
                            Text(text)
                                .font(.title)
                                .bold()
                                .foregroundColor(.black)
                                .padding(.bottom, 8)
                        case 2:
                            Text(text)
                                .font(.headline)
                                .bold()
                                .foregroundColor(.black)
                                .padding(.bottom, 6)
                        default:
                            Text(text)
                                .font(.subheadline)
                                .bold()
                                .foregroundColor(.black)
                                .padding(.bottom, 4)
                        }
                    case .paragraph(let text):
                        Text(text)
                            .font(.body)
                            .foregroundColor(.black)
                            .padding(.bottom, 4)
                    case .list(let items):
                        VStack(alignment: .leading, spacing: 4) {
                            ForEach(items, id: \.self) { item in
                                Text("• \(item)")
                                    .font(.body)
                                    .foregroundColor(.black)
                                    .padding(.bottom, 2)
                            }
                        }
                    case .codeBlock(let text):
                        Text(text)
                            .font(.system(.body, design: .monospaced))
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(4)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct Markdown_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 16) {
            Markdown(markdown: "# Heading 1\n\nThis is a *Markdown* paragraph.\n\n- List item 1\n- List item 2\n\n```\nCode block\n```\n\nAnother paragraph.")
                .render()
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
