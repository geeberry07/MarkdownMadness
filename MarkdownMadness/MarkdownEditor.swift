import SwiftUI

struct MarkdownEditor: View {
    @Binding var markdown: String
    @State private var showModal: Bool = false

    var bodyStyle: Font = .body
    var headingStyle: Font = .title
    var codeStyle: Font = .custom("Courier", size: 16)
    var linkStyle: Font = .body
    var listStyle: Font = .body

    func renderMarkdown() -> some View {
        let markdownLines = markdown.split(separator: "\n").map { String($0) }
        return Group {
            ForEach(markdownLines, id: \.self) { line in
                if line.starts(with: "# ") {
                    Text(line.dropFirst(2))
                        .font(headingStyle)
                        .fontWeight(.bold)
                        .padding(.top, 8)
                } else if line.starts(with: "## ") {
                    Text(line.dropFirst(3))
                        .font(headingStyle)
                        .fontWeight(.bold)
                        .padding(.top, 6)
                } else if line.starts(with: "### ") {
                    Text(line.dropFirst(4))
                        .font(headingStyle)
                        .fontWeight(.bold)
                        .padding(.top, 4)
                } else if line.starts(with: "#### ") {
                    Text(line.dropFirst(5))
                        .font(headingStyle)
                        .fontWeight(.bold)
                        .padding(.top, 2)
                } else if line.starts(with: "- ") {
                    Text(line.dropFirst(2))
                        .font(listStyle)
                        .padding(.leading, 20)
                } else if line.starts(with: "```") {
                    // Code block handling (if needed)
                } else if line.contains("[") && line.contains("](") {
                    let parts = line.components(separatedBy: "](")
                    let linkText = parts[0].replacingOccurrences(of: "[", with: "")
                    let linkURL = parts[1].replacingOccurrences(of: ")", with: "")
                    Text(linkText)
                        .foregroundColor(.blue)
                        .underline()
                        .onTapGesture {
                            // Handle tap on link (if needed)
                            guard let url = URL(string: linkURL) else { return }
                            UIApplication.shared.open(url)
                        }
                } else {
                    Text(line)
                        .font(bodyStyle)
                }
                Text("\n")
            }
        }
    }

    var body: some View {
        VStack {
            TextEditor(text: $markdown)
                .font(.system(.body, design: .monospaced))
                .padding()
                .border(Color.gray, width: 1)
            
            Divider()

            ScrollView {
                renderMarkdown()
                    .padding()
            }
            .background(Color.secondary.opacity(0.1))
            .cornerRadius(8)
            .padding()

            Spacer()

            Button(action: {
                showModal.toggle()
            }) {
                Text("Preview")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
            .sheet(isPresented: $showModal) {
                // Modal view to display preview
                PreviewModal(markdown: markdown)
            }
        }
        .padding()
    }
}

struct PreviewModal: View {
    var markdown: String

    var body: some View {
        ScrollView {
            VStack {
                MarkdownPreview(markdown: markdown)
                    .padding()
                
                Button(action: {
                    // Close modal action
                }) {
                    Text("Close")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
        }
    }
}

struct MarkdownPreview: View {
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
                    Text(line.dropFirst(2))
                        .font(.body)
                        .padding(.leading, 20)
                } else if line.starts(with: "```") {
                    // Code block handling (if needed)
                } else if line.contains("[") && line.contains("](") {
                    let parts = line.components(separatedBy: "](")
                    let linkText = parts[0].replacingOccurrences(of: "[", with: "")
                    let linkURL = parts[1].replacingOccurrences(of: ")", with: "")
                    Text(linkText)
                        .foregroundColor(.blue)
                        .underline()
                        .onTapGesture {
                            // Handle tap on link (if needed)
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
        renderMarkdown()
    }
}

struct MarkdownEditor_Previews: PreviewProvider {
    @State static var markdown = """
    # Heading

    This is a body text.

    - List item

    [Link](http://example.com)
    """

    static var previews: some View {
        MarkdownEditor(markdown: $markdown)
    }
}
