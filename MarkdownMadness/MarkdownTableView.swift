import SwiftUI

struct MarkdownTableView: View {
    var markdown: String

    func parseTable() -> [[String]] {
        let lines = markdown.split(separator: "\n").map { String($0) }
        var tableData: [[String]] = []

        for line in lines {
            let cells = line.split(separator: "|").map { String($0).trimmingCharacters(in: .whitespaces) }
            tableData.append(cells)
        }

        return tableData
    }

    func renderTable() -> some View {
        let tableData = parseTable()
        return VStack(alignment: .leading, spacing: 0) {
            ForEach(0..<tableData.count, id: \.self) { rowIndex in
                HStack {
                    ForEach(0..<tableData[rowIndex].count, id: \.self) { columnIndex in
                        Text(tableData[rowIndex][columnIndex])
                            .font(.body)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(rowIndex == 0 ? Color.gray.opacity(0.2) : Color.clear)
                            .border(Color.gray, width: 1)
                    }
                }
            }
        }
    }

    var body: some View {
        ScrollView(.horizontal) {
            renderTable()
                .padding()
        }
        .background(Color.secondary.opacity(0.1))
        .cornerRadius(8)
        .padding()
    }
}

struct MarkdownTableView_Previews: PreviewProvider {
    static var previews: some View {
        MarkdownTableView(markdown: """
        | Header 1 | Header 2 | Header 3 |
        |----------|----------|----------|
        | Row 1 Col 1 | Row 1 Col 2 | Row 1 Col 3 |
        | Row 2 Col 1 | Row 2 Col 2 | Row 2 Col 3 |
        """)
    }
}
