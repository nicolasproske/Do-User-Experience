import SwiftUI

struct StyledButtonModifier: ViewModifier {
    let buttonStyle: ButtonStyle
    
    private let cornerRadius: CGFloat = 12.0
    private let offsetTrailing: CGFloat = 4.0
    private let offsetBottom: CGFloat = 5.0
    private let horizontalPadding: CGFloat = 12.0
    private let verticalPadding: CGFloat = 5.0
    
    func body(content: Content) -> some View {
        if buttonStyle == .primaryIcon {
            content
                .frame(width: 36, height: 36)
                .foregroundColor(buttonStyle.foregroundColor)
                .background(buttonStyle.backgroundColor)
                .overlay(
                    Circle()
                        .stroke(.black, lineWidth: 4)
                )
                .clipShape(Circle())
        } else if buttonStyle == .prominent {
            ZStack {
                content
                    .styledButton(.secondaryDefault)
                    .offset(x: offsetTrailing, y: offsetBottom)
                
                content
                    .styledButton(.primaryDefault)
            }
            .padding(.trailing, offsetTrailing)
            .padding(.bottom, offsetBottom)
        } else {
            content
                .padding(.horizontal, horizontalPadding)
                .padding(.vertical, verticalPadding)
                .foregroundColor(buttonStyle.foregroundColor)
                .background(buttonStyle.backgroundColor)
                .cornerRadius(cornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(.black, lineWidth: buttonStyle == .plain ? 0 : 2)
                )
        }
    }
}
