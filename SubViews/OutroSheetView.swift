import SwiftUI

struct OutroSheetView: View {
    
    // Currently shown page
    @Binding var currentPage: Int
    
    // Progress of the lessons from 0 to 1
    @Binding var progress: CGFloat
    
    // Current count of shown messages
    @State private var shownMessages: Int = 1
    
    var body: some View {
        VStack {
            SheetHeader(title: "Let's recap", caption: "Thanks for joining! 🤟", currentPage: $currentPage, progress: $progress)
            
            ScrollableContent {
                // Nico says
                firstSection
                
                // Robo says
                if shownMessages >= 2 {
                    secondSection
                }
            }
            
            if shownMessages < 5 {
                SheetFooter(subtitle: shownMessages == 4 ? "finish 🎉" : "continue") {
                    shownMessages += 1
                }
            }
        }
    }
    
    // OutroSheetView Inline Views
    
    private var firstSection: some View {
        VStack(alignment: .leading) {
            NicoSays()
            
            Bubble(id: 1, hidden: shownMessages < 1, message: "That's it - well, at least for now. Big kudos and thanks to the greatest tutor Robo 🤖! What an insightful entry into the vast world of user experience. As always, the last words are spoken by Robo.")
        }
        .padding(.trailing, 100)
    }
    
    private var secondSection: some View {
        VStack(alignment: .trailing) {
            RoboSays()
            
            Bubble(id: 2, hidden: shownMessages < 2, message: "I hope you enjoyed it as much as I did! It was really fun teaching you a bunch of new things today! 😎")
            Bubble(id: 3, hidden: shownMessages < 3, icon: "🖥", message: "You have not had enough yet? Try searching for \"Human Interface Guidelines\" on Apple's website!")
            Bubble(id: 4, hidden: shownMessages < 4, message: "Nico and my humble self wish you a great rest of the day. See you at the event! 👋")
        }
        .padding(.leading, 100)
    }
}
