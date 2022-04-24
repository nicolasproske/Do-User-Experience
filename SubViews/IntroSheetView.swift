import SwiftUI

struct IntroSheetView: View {
    
    // Currently shown page
    @Binding var currentPage: Int
    
    // Progress of the lessons from 0 to 1
    @Binding var progress: CGFloat
    
    // Current count of shown messages
    @State private var shownMessages: Int = 1
    
    var body: some View {
        VStack {
            SheetHeader(title: "Do U(ser) Experience?!", caption: "Welcome, I'm happy to see you here 👋", currentPage: $currentPage, progress: $progress)
            
            ScrollableContent {
                // Nico says
                firstSection
                
                // Robo says
                if shownMessages >= 3 {
                    secondSection
                }
            }
            
            SheetFooter(subtitle: shownMessages == 4 ? "start the journey ➡️" : "continue") {
                if shownMessages < 4 {
                    shownMessages += 1
                } else {
                    currentPage = 1
                }
            }
        }
    }
    
    // IntroSheetView Inline Views
    
    private var firstSection: some View {
        VStack(alignment: .leading) {
            NicoSays()
            
            Bubble(id: 1, hidden: shownMessages < 1, message: "Spring has just begun and it's already time for the next WWDC and another incredible Swift Student Challenge!")
            
            Bubble(id: 2, hidden: shownMessages < 2, message: "But first of all: Hi, I'm Nico - 🤖 Robo's tutor. Robo is going to be your instructor for the following lessons.\nI'm excited to see what topic he has up his sleeve this time. Have a lot of fun! ✌️")
        }
        .padding(.trailing, 100)
    }
    
    private var secondSection: some View {
        VStack(alignment: .trailing) {
            RoboSays()
            
            Bubble(id: 3, hidden: shownMessages < 3, message: "Wow, nice to see you again! After you proved your coding skills last time, I want to use the upcoming 3 minutes to give you a brief introduction to what really matters in life: \"User Experience\", of course 👀.")
            
            Bubble(id: 4, hidden: shownMessages < 4, message: "Well, enough talking for now - Let's start with the interactive part 🤙")
        }
        .padding(.leading, 100)
    }
}
