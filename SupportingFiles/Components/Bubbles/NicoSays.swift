import SwiftUI

struct NicoSays: View {
    var body: some View {
        HStack(spacing: 3) {
            Image("LittleNico")
                .resizable()
                .scaledToFit()
                .frame(width: 26, height: 26)
            
            Text("Nico says ...")
                .defaultFont(size: 16)
                .foregroundColor(.white)
        }
    }
}
