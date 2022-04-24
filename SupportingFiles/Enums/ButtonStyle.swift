import SwiftUI

enum ButtonStyle {
    case plain, primaryDefault, secondaryDefault, prominent, primaryIcon
    
    var backgroundColor: Color {
        switch self {
        case .plain:
            return .clear
        case .primaryDefault, .prominent, .primaryIcon:
            return .theme.yellow
        case .secondaryDefault:
            return .theme.blue
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .plain:
            return .primary
        case .primaryDefault, .prominent, .primaryIcon:
            return .black
        case .secondaryDefault:
            return .white
        }
    }
    }
