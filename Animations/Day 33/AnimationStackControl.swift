/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/controlling-the-animation-stack

import SwiftUI



struct AnimationStackControl: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    @State private var hasEnabledAnimation: Bool = false
    
    
    
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        Button("Tap Me") {
            hasEnabledAnimation.toggle()
        }
        .font(.title)
        .frame(width: 200, height: 200)
        .foregroundColor(.white)
        .background(hasEnabledAnimation ? .yellow : .blue)
        .animation(.default, value: hasEnabledAnimation)
        .clipShape(RoundedRectangle(cornerRadius: hasEnabledAnimation ? 50 : 0))
        .animation(.interpolatingSpring(stiffness: 10.00, damping: 1.00),
                   value: hasEnabledAnimation)
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}






// PREVIEW //////////////////////////////////////////////
struct AnimationStackControl_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        AnimationStackControl()
    }
}
