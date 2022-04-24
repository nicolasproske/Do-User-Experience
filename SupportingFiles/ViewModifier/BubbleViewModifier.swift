import SwiftUI

struct BubbleModifier: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .defaultFont(size: 20.0 ,weight: .semibold)
            .foregroundColor(.white)
            .multilineTextAlignment(.leading)
            .lineSpacing(10.0)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(12)
            .frame(maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.white, lineWidth: 2)
            )
            .padding(2) // Padding because of border
            .transition(
                .asymmetric(
                    insertion: .move(edge: .trailing),
                    removal: .move(edge: .leading)
                )
            )
    }
}
