import SwiftUI

struct WWDCIcon: View {
    
    // Size of the inner icon
    let iconSize: CGFloat
    
    // Stroke width of the icon
    var lineWidth: CGFloat = 1.0
    
    private let imageNames: [String] = ["applelogo", "swift", "graduationcap.fill"]
    
    var body: some View {
        ZStack {
            // Background circle
            Circle()
                .fill(
                    LinearGradient(colors: [.theme.wwdc22darkBlue, .black], startPoint: .top, endPoint: .bottom)
                )
            
            // Inner icon
            logo
                .foregroundColor(.clear)
                .overlay {
                    LinearGradient(colors: [Color(hex: 0x061423), Color(hex: 0x406082)], startPoint: .bottomTrailing, endPoint: .topLeading)
                        .mask {
                            logo
                        }
                }
        }
        .frame(width: iconSize, height: iconSize)
        .overlay(
            Circle()
                .strokeBorder(
                    AngularGradient(colors: [.orange, .yellow, .green, .teal, .blue,
                                             .blue, .indigo, .indigo, .black, .black,
                                             .black, .purple, .purple, .purple, .black,
                                             .black, .black, .black, .black, .orange].reversed(),
                                    center: .center, startAngle: .degrees(-90), endAngle: .degrees(270)), lineWidth: lineWidth
                )
        )
        .opacity(Double.random(in: 0.3...0.8))
    }
    
    // WWDCIcon Inline Views
    
    private var logo: some View {
        Image(systemName: imageNames.randomElement()!)
            .resizable()
            .scaledToFit()
            .frame(width: iconSize / 2, height: iconSize / 2)
    }
}
