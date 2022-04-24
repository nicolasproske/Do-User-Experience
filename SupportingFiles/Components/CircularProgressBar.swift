import SwiftUI

struct CircularProgressBar: View {
    
    // Progress of the lessons from 0 to 1
    @Binding var progress: CGFloat

    // Tint color of the circle and text
    var color: Color = Color.theme.blue
    
    // Maximal width and height of the circle
    var width: CGFloat = 50.0

    // Width of the circle line
    private let lineWidth: CGFloat = 8.0

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: lineWidth)
                .opacity(0.5)

            Circle()
                .trim(from: 0, to: CGFloat(min(progress, 1)))
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle(degrees: 270))
                .animation(.interactiveSpring(), value: progress)

            Text("\(min(progress, 1) * 100, specifier: "%.0f")%")
                .defaultFont(size: 13, weight: .bold)
        }
        .foregroundColor(color)
        .frame(width: width, height: width)
    }
}
