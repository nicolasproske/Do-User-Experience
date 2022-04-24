import SwiftUI

struct PressReleaseActionModifier: ViewModifier {
    
    // Action at the start of pressing the button
    var onPress: () -> Void
    
    // Action at the end of pressing the button
    var onRelease: () -> Void
    
    func body(content: Content) -> some View {
        content
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged({ _ in
                        onPress()
                    })
                    .onEnded({ _ in
                        onRelease()
                    })
            )
    }
}
