import SwiftUI

struct ContentView: View {
    
    // Main sheet
    @State private var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            WWDCBackground()
                .sheet(isPresented: $showSheet) {
                    SheetView()
                }
            
            if !showSheet {
                sheetButton
            }
        }
        .onAppear {
            showSheet = true
        }
    }
    
    // ContentView Inline Views
    
    private var sheetButton: some View {
        Button {
            showSheet = true
        } label: {
            Text("Nothing's here? Press me to get started!")
        }
        .styledButton(.prominent)
    }
}
