import Foundation

protocol Styleable {
    var headingStyle: [NSAttributedString.Key: Any] { get set }
    var bodyStyle: [NSAttributedString.Key: Any] { get set }
    var codeStyle: [NSAttributedString.Key: Any] { get set }
    var linkStyle: [NSAttributedString.Key: Any] { get set }
    var listStyle: [NSAttributedString.Key: Any] { get set }
    func applyStyles(to attributedString: NSAttributedString) -> NSAttributedString
}
