import SwiftUI

struct MarkdownImageView: View {
    var imageUrl: String

    var body: some View {
        if let url = URL(string: imageUrl) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                case .failure(_):
                    Text("Failed to load image")
                        .foregroundColor(.red)
                case .empty:
                    ProgressView()
                @unknown default:
                    ProgressView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.secondary.opacity(0.1)) // Optional: Add a background for better visibility
            .cornerRadius(8)
        } else {
            Text("Invalid URL")
                .foregroundColor(.red)
        }
    }
}

struct MarkdownImageView_Previews: PreviewProvider {
    static var previews: some View {
        MarkdownImageView(imageUrl: "https://example.com/image.png")
    }
}
