import SwiftUI

struct WWDCBackground: View {
    
    // Size of a WWDCIcon
    private let iconSize: CGFloat = 72.5
    
    var body: some View {
        GeometryReader { geometry in
            LazyVStack(spacing: 20) {
                ForEach(0..<Int(geometry.size.height / iconSize), id: \.self) { _ in
                    LazyHStack(spacing: 20) {
                        ForEach(0..<Int(geometry.size.width / iconSize), id: \.self) { _ in
                            WWDCIcon(iconSize: iconSize)
                        }
                    }
                }
            }
            .background(
                LinearGradient(colors: [.theme.wwdc22darkBlue, .black], startPoint: .top, endPoint: .bottom)
            )
        }
    }
}
