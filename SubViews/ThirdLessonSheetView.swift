import SwiftUI

struct ThirdLessonSheetView: View {
    
    // Currently shown page
    @Binding var currentPage: Int
    
    // Progress of the lessons from 0 to 1
    @Binding var progress: CGFloat
    
    // Counter to trigger the confetti cannon on change
    @Binding var confettiCounter: Int
    
    // Current count of shown messages
    @State private var shownMessages: Int = 1
    
    var body: some View {
        VStack {
            SheetHeader(title: "The Big 6", caption: "Apple's Design Principles 📦", currentPage: $currentPage, progress: $progress)
            
            ScrollableContent {
                // Robo says
                firstSection
            }
            
            SheetFooter(subtitle: shownMessages == 7 ? "get to the next page ➡️" : "continue") {
                if progress < 0.75 {
                    progress += 0.05
                }
                
                if shownMessages < 7 {
                    shownMessages += 1
                } else {
                    currentPage = 4
                    confettiCounter += 1
                }
            }
        }
    }
    
    // ThirdLessonSheetView Inline Views
    
    private var firstSection: some View {
        VStack(alignment: .trailing) {
            RoboSays()
            
            // Source: https://developer.apple.com/design/human-interface-guidelines/ios/overview/themes/
            
            Bubble(id: 1, message: "The best approach to achieve an overall better app is by adhering to certain simple design principles:")
            Bubble(id: 2, hidden: shownMessages < 2, icon: "🎯", message: "Aesthetic Integrity: How well do the app’s appearance and behavior integrate with its function.")
            Bubble(id: 3, hidden: shownMessages < 3, icon: "💡", message: "Direct Manipulation: Directly manipulate onscreen content. Don't know what that means? Just smile and take a selfie 😎")
            
            // Example with a virtual selfie
            if shownMessages >= 3 {
                FirstExample()
            }
            
            Bubble(id: 4, hidden: shownMessages < 4, icon: "🛎", message: "Feedback: Acknowledge actions and show results to keep people informed.")
            
            // Example with an alert
            if shownMessages >= 4 {
                SecondExample()
            }
            
            Bubble(id: 5, hidden: shownMessages < 5, icon: "✨", message: "Metaphors: Use metaphors of familiar experiences for the app's virtual objects.")
            Bubble(id: 6, hidden: shownMessages < 6, icon: "🕹", message: "User Control: People - not the app - are in control.")
            Bubble(id: 7, hidden: shownMessages < 7, icon: "🌿", message: "Consistency: Let's focus on that in the next & last lesson.")
        }
        .padding(.leading, 100)
    }
}

// SubViews

private struct FirstExample: View {
    @State private var isPressed = false
    
    let emojis: [String] = ["😯", "🥴", "🤪", "🥱", "🤗"]
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack(spacing: 10) {
                if let randomEmoji = emojis.randomElement() {
                    Text("\(isPressed ? "\(randomEmoji) 📸" : "🙂 📷")")
                        .defaultFont(size: 40)
                }
                
                Button {
                    // Ignore here and handle actions using .pressAction modifier
                } label: {
                    Text("Take a virtual selfie")
                }
                .pressReleaseAction {
                    isPressed = true
                } onRelease: {
                    isPressed = false
                }
                .buttonStyle(.plain)
                .styledButton(.primaryDefault)
            }
            
            Spacer()
        }
        .bubbleModifier()
    }
}

private struct SecondExample: View {
    @State private var showAlert = false
    @State private var isRoboNominated = false
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack(spacing: 10) {
                Text("🤖\(isRoboNominated ? "📬" : "📭")")
                    .defaultFont(size: 40)
                
                Button {
                    showAlert = true
                    isRoboNominated.toggle()
                } label: {
                    Text(isRoboNominated ? "Revise nomination" : "Nominate Robo")
                }
                .buttonStyle(.plain)
                .styledButton(.primaryDefault)
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text(isRoboNominated ? "Nomination successful 📬" : "Revision successful 📭"), message: Text(isRoboNominated ? "Great! Robo was submitted as a candidate for the best tutor of this years WWDC!" : "The submission of Robo was revised."), dismissButton: .default(Text("OK")))
            }
            
            Spacer()
        }
        .bubbleModifier()
    }
}
