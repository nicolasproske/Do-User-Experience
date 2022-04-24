import SwiftUI

struct SheetView: View {
    
    // Currently shown page
    @State private var currentPage: Int = 0
    
    // Progress of the lessons from 0 to 1
    @State private var progress: CGFloat = 0.0
    
    // Counter to trigger the confetti cannon on change
    @State private var confettiCounter: Int = 0
    
    var body: some View {
        VStack {
            ConfettiCannon(counter: $confettiCounter, num: 45, rainHeight: 1000, openingAngle: Angle(degrees: 0), closingAngle: Angle(degrees: 360), radius: 250)
            
            TabView(selection: $currentPage) {
                Group {
                    // Do U(ser) Experience?! - Welcome, I'm happy to see you here 👋
                    IntroSheetView(currentPage: $currentPage, progress: $progress)
                        .tag(0)
                    
                    // First exercise - Getting in touch 📱
                    FirstLessonSheetView(currentPage: $currentPage, progress: $progress, confettiCounter: $confettiCounter)
                        .tag(1)
                    
                    // A brief introduction - It's all about the basics 💭
                    SecondLessonSheetView(currentPage: $currentPage, progress: $progress, confettiCounter: $confettiCounter)
                        .tag(2)
                    
                    // The Big 6 - Apple's Design Principles 📦
                    ThirdLessonSheetView(currentPage: $currentPage, progress: $progress, confettiCounter: $confettiCounter)
                        .tag(3)
                    
                    // No. 1 principle - The magic behind consistency 🔮
                    FourthLessonSheetView(currentPage: $currentPage, progress: $progress, confettiCounter: $confettiCounter)
                        .tag(4)
                    
                    // Let's recap - Thanks for joining! 🤟
                    OutroSheetView(currentPage: $currentPage, progress: $progress)
                        .tag(5)
                }
                .padding(.horizontal, 25)
                .padding(.vertical, 50)
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
        }
        .background(Color.theme.blue)
        .interactiveDismissDisabled()
    }
}
