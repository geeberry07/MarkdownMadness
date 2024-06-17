import SwiftUI

struct MarkdownParagraphRenderer: View {
    let text: String

    var body: some View {
        if text.isEmpty {
            Text("")
                .padding()
        } else {
            Text(text)
                .font(.body)
                .padding()
        }
    }
}

struct MarkdownParagraphRenderer_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 16) {
            MarkdownParagraphRenderer(text: """
            **Protocols** in Swift provide a powerful way to define blueprints of methods, properties, and other requirements that conforming types must implement. They serve as contracts that specify what functionalities a type must have without providing the implementation details. This allows for flexibility and reusability in code, enabling different types to conform to the same protocol while still maintaining their unique implementations. Protocols support a wide range of functionalities, from simple requirements like properties and methods to more advanced features such as protocol extensions, default implementations, and protocol inheritance, making them essential for achieving abstraction and polymorphism in Swift programming.
            """)

            MarkdownParagraphRenderer(text: """
            **Models** in Swift are fundamental components used to represent structured data within applications. They typically encapsulate properties and behaviors relevant to a specific entity or concept, such as a User, Product, or Order. Models are often defined using classes or structs, depending on the specific requirements of the application. They serve as a central abstraction layer between the data layer (often represented by databases or APIs) and the user interface layer, enabling efficient data management and manipulation. Models in Swift can leverage features like properties, methods, initializers, and conformances to protocols to encapsulate and manipulate data effectively. The **difference between classes and structs** in Swift lies primarily in their fundamental characteristics and use cases. Classes are reference types, meaning instances are shared by reference, allowing for identity comparison and the possibility of inheritance. They support features like inheritance, deinitializers, reference counting (for memory management), and more complex object-oriented programming paradigms. On the other hand, structs are value types, meaning instances are copied when assigned or passed around, making them more predictable in terms of mutability and concurrency. Structs are suitable for defining lightweight data structures or models where copying behavior and immutability are preferred, although they lack certain features like inheritance and deinitializers.

            The **Optional** type plays a crucial role in handling potentially absent values. Optionals allow variables and properties to either contain a value of a specific type or be nil, indicating the absence of a value. This feature enhances type safety by forcing developers to explicitly handle the possibility of nil values, thereby reducing runtime errors and improving code robustness. Optionals are commonly used in scenarios where a value might not always be present, such as when parsing JSON data from a remote server or when dealing with user input. Swift's syntax for working with Optionals, including optional chaining and forced unwrapping, provides flexible and concise ways to safely access and manipulate optional values within applications.
            """)

            MarkdownParagraphRenderer(text: """
            In Swift, the **Optional** type plays a crucial role in handling potentially absent values. Optionals allow variables and properties to either contain a value of a specific type or be nil, indicating the absence of a value. This feature enhances type safety by forcing developers to explicitly handle the possibility of nil values, thereby reducing runtime errors and improving code robustness. Optionals are commonly used in scenarios where a value might not always be present, such as when parsing JSON data from a remote server or when dealing with user input. Swift's syntax for working with Optionals, including optional chaining and forced unwrapping, provides flexible and concise ways to safely access and manipulate optional values within applications.
            """)
        }
        .padding()
    }
}
