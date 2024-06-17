import Foundation

protocol Renderable {
    var markdown: String { get set }
    func renderMarkdown() -> NSAttributedString
}
