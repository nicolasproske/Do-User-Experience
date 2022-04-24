import SwiftUI

struct DefaultFontModifier: ViewModifier {
    let size: CGFloat
    let weight: Font.Weight
    
    func body(content: Content) -> some View {
        return content
            .font(.system(size: size, weight: weight, design: .rounded))
    }
}
