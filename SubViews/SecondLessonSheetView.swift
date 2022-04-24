import SwiftUI

struct SecondLessonSheetView: View {
    
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
            SheetHeader(title: "A brief introduction", caption: "It's all about the basics 💭", currentPage: $currentPage, progress: $progress)
            
            ScrollableContent {
                // Robo says
                firstSection
                
                // Nico says
                if shownMessages >= 3 {
                    secondSection
                }
            }
            
            SheetFooter(subtitle: shownMessages == 3 ? "get to the next page ➡️" : "continue") {
                if progress < 0.4 {
                    progress += 0.05
                }
                
                if shownMessages < 3 {
                    shownMessages += 1
                } else {
                    currentPage = 3
                    confettiCounter += 1
                }
            }
        }
    }
    
    // SecondLessonSheetView Inline Views
    
    private var firstSection: some View {
        VStack(alignment: .trailing) {
            RoboSays()
            
            // Source: https://medium.com/geekculture/what-is-end-user-experience-for-apps-9ee1a5b32c46
            Bubble(id: 1, message: "So, what does \"user experience\" actually stand for in terms of app development?")
            Bubble(id: 2, hidden: shownMessages < 2, message: "In a nutshell, it's a term that refers to the overall experience of using the app. An important part of this is the user interface and its usability.")
        }
        .padding(.leading, 100)
    }
    
    private var secondSection: some View {
        VStack(alignment: .leading) {
            NicoSays()
            
            // Source: http://tomeri.org/AHA.html
            Bubble(id: 3, hidden: shownMessages < 3, message: "By the way: Apple established their first User Experience Architects' Office in the spring of '93. From then on, the term \"user experience\" became more and more popular and is now known worldwide.")
        }
        .padding(.trailing, 100)
    }
}
