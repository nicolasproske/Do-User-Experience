import AuthenticationServices
import SwiftUI

struct FirstLessonSheetView: View {
    
    // Currently shown page
    @Binding var currentPage: Int
    
    // Progress of the lessons from 0 to 1
    @Binding var progress: CGFloat
    
    // Counter to trigger the confetti cannon on change
    @Binding var confettiCounter: Int
    
    // Current count of shown messages
    @State private var shownMessages: Int = 1
    
    // State of button for secure input
    @State private var isSecureTextField: Bool = false
    
    // State of button for button styles
    @State private var isWeightedButtons: Bool = false
    
    // State of button for text hiearchy
    @State private var isTextHierarchy: Bool = false
    
    // State of button for input field info
    @State private var isFloatingInfoTextField: Bool = false
    
    var body: some View {
        VStack {
            SheetHeader(title: "First exercise", caption: "Getting in touch 📱", currentPage: $currentPage, progress: $progress)
        
            ScrollableContent {
                // Robo says
                firstSection
                
                // Login screen example
                if shownMessages >= 2 {
                    LoginScreenExample(isTextHierarchy: $isTextHierarchy, isFloatingInfoTextField: $isFloatingInfoTextField, isSecureTextField: $isSecureTextField, isWeightedButtons: $isWeightedButtons)
                        .padding(.leading, 100)
                }
                
                // Selection buttons
                if shownMessages >= 3 {
                    secondSection
                }
                
                // Nico says
                if shownMessages >= 4 {
                    thirdSection
                }
            }
            
            SheetFooter(subtitle: shownMessages == 4 ? "get to the next page ➡️" : "continue") {
                if progress < 0.25 {
                    if shownMessages == 3 {
                        progress += 0.1
                    } else {
                        progress += 0.05
                    }
                }
                
                if shownMessages < 4 {
                    shownMessages += 1
                } else {
                    currentPage = 2
                    confettiCounter += 1
                }
            }
        }
    }
    
    // FirstLessonSheetView Inline Views
    
    private var firstSection: some View {
        VStack(alignment: .trailing) {
            RoboSays()
            
            Bubble(id: 1, message: "To get in touch, I have prepared an interactive login screen for you. Tap on the yellow button below after exploring the interface.")
        }
        .padding(.leading, 100)
    }
    
    private var secondSection: some View {
        VStack(alignment: .trailing) {
            Bubble(id: 2, hidden: shownMessages < 2, message: "Now you can use the buttons below to change the look and feel of the user interface. Give it a try!")
            
            SelectionSection(isSecureTextField: $isSecureTextField, isWeightedButtons: $isWeightedButtons, isTextHierarchy: $isTextHierarchy, isFloatingInfoTextField: $isFloatingInfoTextField)
        }
        .padding(.leading, 100)
    }
    
    private var thirdSection: some View {
        VStack(alignment: .leading) {
            if shownMessages >= 3 {
                NicoSays()
            }
            
            Bubble(id: 3, hidden: shownMessages < 3, message: "Awesome! I just tested the improved user interface and with only four minor changes you have been able to achieve a significantly better user experience. But why is that? Robo will tell you all about it.")
        }
        .padding(.trailing, 100)
    }
}

// SubViews

private struct LoginScreenExample: View {
    @Binding var isTextHierarchy: Bool
    @Binding var isFloatingInfoTextField: Bool
    @Binding var isSecureTextField: Bool
    @Binding var isWeightedButtons: Bool
    
    var body: some View {
        VStack {
            VStack {
                headerSection
                formSection
                buttonSection
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(12)
        }
    }
    
    // LoginScreenExample Inline Views
    
    private var headerSection: some View {
        VStack {
            Text("Welcome back 👋")
                .font(isTextHierarchy ? .system(size: 24, weight: .bold, design: .rounded) : .body)
            
            Text("Log in to your existing account")
                .font(isTextHierarchy ? .system(size: 18, design: .rounded) : .body)
                .padding(.bottom, 15)
        }
    }
    
    private var formSection: some View {
        Group {
            VStack(alignment: .leading, spacing: 0) {
                if isFloatingInfoTextField {
                    Text("Email")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                TextField("What's your email?", text: .constant(""))
            }
            
            VStack(alignment: .leading, spacing: 0) {
                if isFloatingInfoTextField {
                    Text("Password")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
                if isSecureTextField {
                    SecureField("What's your password?", text: .constant("#SwiftStudentChallenge"))
                } else {
                    TextField("What's your password", text: .constant("#SwiftStudentChallenge"))
                }
            }
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 10)
        .background(Color(.systemBackground))
        .cornerRadius(8)
        .padding(.bottom, 15)
    }
    
    private var buttonSection: some View {
        VStack {
            Button {
                print("Tap login")
            } label: {
                Text("Login")
                    .frame(maxWidth: .infinity)
            }
            .styledButton(isWeightedButtons ? .prominent : .plain)
            
            Button {
                print("Tap forgot password")
            } label: {
                Text("Forgot password?")
                    .frame(maxWidth: .infinity)
            }
            .styledButton(isWeightedButtons ? .secondaryDefault : .plain)
            
            Text("- Don't have an account yet? -")
                .font(isTextHierarchy ? .system(size: 15, design: .rounded) : .body)
                .padding(.top)
            
            Button {
                print("Tap sign in with apple")
            } label: {
                SignInWithAppleButton()
                    .frame(maxWidth: .infinity, minHeight: 40)
            }
            .buttonStyle(.plain)
        }
    }
}

private struct SignInWithAppleButton: UIViewRepresentable {
    typealias UIViewType = ASAuthorizationAppleIDButton
    
    func makeUIView(context: Context) -> UIViewType {
        return ASAuthorizationAppleIDButton()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

private struct SelectButton: View {
    let title: String
    @Binding var isSelected: Bool
    
    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
            VStack {
                Text(title)
                    .lineLimit(1)
                Image(systemName: "checkmark.circle\(isSelected ? ".fill" : "")")
            }
            .padding(10)
            .frame(maxWidth: .infinity)
        }
        .styledButton(.primaryDefault)
    }
}

private struct SelectionSection: View {
    // State of button for secure input
    @Binding var isSecureTextField: Bool
    
    // State of button for button styles
    @Binding var isWeightedButtons: Bool
    
    // State of button for text hiearchy
    @Binding var isTextHierarchy: Bool
    
    // State of button for input field info
    @Binding var isFloatingInfoTextField: Bool
    
    var body: some View {
        VStack {
            HStack {
                SelectButton(title: "Secure input", isSelected: $isSecureTextField)
                SelectButton(title: "Button styles", isSelected: $isWeightedButtons)
            }
            
            HStack {
                SelectButton(title: "Text hiararchy", isSelected: $isTextHierarchy)
                SelectButton(title: "Input field info", isSelected: $isFloatingInfoTextField)
            }
        }
        .padding(.horizontal, 2)
    }
}
