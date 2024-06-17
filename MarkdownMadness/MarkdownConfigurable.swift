import Foundation

protocol Configurable {
    var enableSyntaxHighlighting: Bool { get set }
    var enableImageRendering: Bool { get set }
    var enableLinkHandling: Bool { get set }
    func configureMarkdownOptions()
}
