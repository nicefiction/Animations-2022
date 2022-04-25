/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/creating-explicit-animations
/// You’ve seen how SwiftUI lets us create implicit animations by attaching the `animation()` modifier to a view,
/// and how it also lets us create animated binding changes by adding the `animation()` modifier to a binding,
/// but there’s a third useful way we can create animations:
/// explicitly asking SwiftUI to animate changes occurring as the result of a state change.

import SwiftUI



struct CreatingExplicitAnimations: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    @State private var animationAmount: Double = 0.00
    
    
    
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        Button("Tap Me") {
            // withAnimation(.easeInOut(duration: 3.00)) {
            withAnimation(.interpolatingSpring(stiffness: 5.00,
                                               damping: 1.00)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .foregroundColor(.white)
        .background(.pink)
        .clipShape(Circle())
        .rotation3DEffect(Angle(degrees: animationAmount),
                          axis: (x: 0.00, y: 1.00, z: 0.00))
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}






// PREVIEW ///////////////////////////////////////////////////
struct CreatingExplicitAnimations_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        CreatingExplicitAnimations()
    }
}
