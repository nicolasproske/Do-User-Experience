import SwiftUI

struct SheetHeader: View {
    
    // Title of the header
    let title: String
    
    // Caption of the header
    let caption: String
    
    // Currently shown page
    @Binding var currentPage: Int
    
    // Progress of the lessons from 0 to 1
    @Binding var progress: CGFloat
    
    var body: some View {
        ZStack {
            centerContent
            
            HStack {
                if currentPage > 0 {
                    leadingContent
                }
                
                Spacer()
                
                if currentPage > 0 || progress > 0 {
                    trailingContent
                }
            }
        }
        .padding(.bottom, 25)
    }
    
    // SheetHeader Inline Views
    
    private var leadingContent: some View {
        Button {
            withAnimation(.interactiveSpring()) {
                currentPage -= 1
            }
        } label: {
            Image(systemName: "arrow.left")
        }
        .styledButton(.primaryIcon)
    }
    
    private var centerContent: some View {
        VStack {
            Text(title)
                .defaultFont(size: 36, weight: .heavy)
                .textCase(.uppercase)
                .foregroundColor(.theme.yellow)
            
            Text(caption)
                .defaultFont(size: 26, weight: .semibold)
                .foregroundColor(.white)
        }
        .multilineTextAlignment(.center)
    }
    
    private var trailingContent: some View {
        CircularProgressBar(progress: $progress, color: .white)
    }
}
