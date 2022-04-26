/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/animating-gestures

import SwiftUI



struct HelloSwiftUI: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    @State private var isEnabled: Bool = false
    @State private var dragAmount: CGSize = CGSize.zero
    
    
    
    // MARK: - PROPERTIES
    let letters = Array("hello world")
    
    
    
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { (eachLetterIndex: Int) in
                Text(String(letters[eachLetterIndex]))
                    .padding(5)
                    .font(.title)
                    .foregroundColor(.white)
                    .background(isEnabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(.default.delay(Double(eachLetterIndex) / 20), value: dragAmount)
            }
        }
        .gesture(
            DragGesture()
                .onChanged {
                    dragAmount = $0.translation
                }
                .onEnded {
                    // dragAmount = CGSize.zero
                    dragAmount = $0.translation
                    isEnabled.toggle()
                }
        )
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}






// PREVIEW /////////////////////////////////////
struct HelloSwiftUI_Previews: PreviewProvider {
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        HelloSwiftUI()
    }
}
