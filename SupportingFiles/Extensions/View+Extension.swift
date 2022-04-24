import SwiftUI

extension View {
    // TextModifier
    
    /// Change font to a rounded shape style
    /// Parameters:
    ///   - size: Size of the font
    ///   - weight: Weight of the font
    /// Returns: Styled font
    func defaultFont(size: CGFloat = 18, weight: Font.Weight = .regular) -> some View {
        modifier(DefaultFontModifier(size: size, weight: weight))
    }
    
    // ViewModifier
    
    /// Add bubble style to a view
    /// Returns: View with bubble style
    func bubbleModifier() -> some View {
        modifier(BubbleModifier())
    }
    
    // ButtonModifier
    
    /// Add button style to a view
    /// Parameter buttonStyle: Style of the button
    /// Returns: View with button style
    func styledButton(_ buttonStyle: ButtonStyle) -> some View {
        modifier(StyledButtonModifier(buttonStyle: buttonStyle))
            .defaultFont(weight: .semibold)
    }
    
    /// Add press actions to a view
    /// Parameters:
    ///   - onPress: Action to be executed on press
    ///   - onRelease: Action to be executed on release
    /// Returns: View with press action
    func pressReleaseAction(onPress: @escaping (() -> Void), onRelease: @escaping (() -> Void)) -> some View {
        modifier(PressReleaseActionModifier(onPress: {
            onPress()
        }, onRelease: {
            onRelease()
        }))
    }
}
