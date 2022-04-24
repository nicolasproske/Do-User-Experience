import SwiftUI

struct FourthLessonSheetView: View {
    
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
            SheetHeader(title: "No. 1 principle", caption: "The magic behind consistency 🔮", currentPage: $currentPage, progress: $progress)
            
            ScrollableContent {
                // Nielsen says
                firstSection
                
                // Robo says
                if shownMessages >= 2 {
                    secondSection
                }
                
                // Nico says
                if shownMessages >= 3 {
                    thirdSection
                }
            }
            
            SheetFooter(subtitle: shownMessages == 5 ? "get to the next page ➡️" : "continue") {
                if progress < 1.0 {
                    progress += 0.05
                }
                
                if shownMessages < 5 {
                    shownMessages += 1
                } else {
                    currentPage = 5
                    confettiCounter += 1
                }
            }
        }
    }
    
    // FourthLessonSheetView Inline Views
    
    private var firstSection: some View {
        VStack(alignment: .leading) {
            NielsenSays()
            
            Bubble(id: 1, message: "Consistency is one of the most powerful usability principles: when things always behave the same, users don’t have to worry about what will happen.")
        }
        .padding(.trailing, 100)
    }
    
    private var secondSection: some View {
        VStack(alignment: .trailing) {
            RoboSays()
            
            Bubble(id: 2, hidden: shownMessages < 2, message: "Examples are worth a thousand words, so let Nico give us his top three tips:")
        }
        .padding(.leading, 100)
    }
    
    private var thirdSection: some View {
        VStack(alignment: .leading) {
            NicoSays()
            
            Bubble(id: 3, hidden: shownMessages < 3, icon: "🥇", message: "Make use of well-known icons with a consistent style. Ensure that the message of your icon is clear:")
            
            if shownMessages >= 3 {
                FirstExample()
            }
            
            Bubble(id: 4, hidden: shownMessages < 4, icon: "🥈", message: "Keep standard text styles and uniform terminology throughout your entire app.")
            
            Bubble(id: 5, hidden: shownMessages < 5, icon: "🥉", message: "Incorporate features and behaviors the way people expect them to be.")
            
            if shownMessages >= 5 {
                SecondExample()
            }
        }
        .padding(.trailing, 100)
    }
}

// SubViews

private struct FirstExample: View {
    @State private var isPressed: Bool = false
    
    var body: some View {
        HStack {
            Text("\(isPressed ? "👎" : "👍")")
                .defaultFont(size: 28)
            
            Spacer()
            
            icons
            
            Spacer()
            
            Button {
                
            } label: {
                Text("Press me \(isPressed ? "🥴" : "👀")")
            }
            .pressReleaseAction {
                isPressed = true
            } onRelease: {
                isPressed = false
            }
            .buttonStyle(.plain)
            .styledButton(.primaryDefault)
        }
        .bubbleModifier()
    }
    
    // FirstExample Inline Views
    
    private var icons: some View {
        HStack {
            Spacer()
            TextIcon(image: isPressed ? "phone.down.circle.fill" : "phone.fill", text: "Calls")
            Spacer()
            TextIcon(image: isPressed ? "house" : "house.fill", text: "Home")
            Spacer()
            TextIcon(image: isPressed ? "trash.square.fill" : "trash.fill", text: "Trash")
            Spacer()
        }
    }
}

private struct SecondExample: View {
    
    // Information message under the slider
    @State private var showSliderMessage: Bool = false
    
    // Current value of the slider
    @State private var sliderValue: CGFloat = 0.5
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                icon
                slider
                
                if showSliderMessage {
                    message
                }
            }
            
            Spacer()
        }
        .bubbleModifier()
    }
    
    // SecondExample Inline Views
    
    private var icon: some View {
        ZStack {
            Text("🪙")
                .defaultFont(size: 32 * sliderValue)
                .offset(x: -7.5, y: -7.5)
            
            Text("🔍")
                .defaultFont(size: 48)
                .opacity(0.75)
        }
    }
    
    private var slider: some View {
        HStack {
            Image(systemName: "minus")
            
            Slider(value: $sliderValue, in: 0.1...0.75) {
                Text("Slider")
            } onEditingChanged: { isEditing in
                if !isEditing {
                    showSliderMessage = true
                }
            }
            .tint(.theme.yellow)
            
            Image(systemName: "plus")
        }
    }
    
    private var message: some View {
        Text("If you can read this, you moved the slider without me telling you what to do. This is a sign for a well done incorporation 👏")
            .defaultFont(size: 16, weight: .semibold)
            .multilineTextAlignment(.center)
    }
}

private struct TextIcon: View {
    let image: String
    let text: String
    
    var body: some View {
        VStack(spacing: 2) {
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
            Text(text)
                .defaultFont(size: 14)
        }
    }
}
