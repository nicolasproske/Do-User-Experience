import SwiftUI

struct Bubble: View {
    
    // Bubble id
    let id: Int
    
    // Optional boolean to hide the bubble
    var hidden: Bool = false
    
    // Leading icon in the form of an emoji
    var icon: String = ""
    
    // Message to be displayed in the bubble
    let message: String
    
    var body: some View {
        Group {
            if !hidden {
                HStack(spacing: 20) {
                    if !icon.isEmpty {
                        Text(icon)
                            .defaultFont(size: 32)
                    }
                    Text(message)
                }
                .bubbleModifier()
                .id(id)
            }
        }
    }
}
