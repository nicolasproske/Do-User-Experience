import SwiftUI

struct SheetFooter: View {
    
    // Subtitle to be shown on the end of the button text
    var subtitle: String = "continue"
    
    // Action to be executed on button press
    let action: () -> Void
    
    var body: some View {
        Button {
            withAnimation(.interactiveSpring()) {
                action()
            }
        } label: {
            Text("Tap here to \(subtitle)")
        }
        .styledButton(.prominent)
        .padding(.top, 5)
    }
}
