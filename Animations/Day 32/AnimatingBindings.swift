/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/animating-bindings
/// These `binding animations `effectively turn the tables on `implicit animations`:
/// rather than setting the animation on a view
/// and implicitly animating it with a state change,
/// we now set nothing on the view
/// and explicitly animate it with a state change.
/// In the former,
/// the state change has no idea it will trigger an animation,
/// and in the latter
/// the view has no idea it will be animated
/// – both work and both are important.

import SwiftUI



struct AnimatingBindings: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    @State private var animationAmount: Double = 1.00
    
    
    
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        VStack {
            Group {
                Slider(value: $animationAmount.animation(
                    .easeInOut(duration: 2.00)
                    .repeatCount(3,
                                 autoreverses: true)
                ),
                       in: 1...9,
                       label: {})
                Stepper("Scale Button...",
                        value: $animationAmount.animation(),
                        in: 1...9)
            }
            .padding()
            
            
            Spacer()
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(50)
            .foregroundColor(.white)
            .background(.pink)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
//            .animation(.default,
//                       value: animationAmount)
        }
    }
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}






// PREVIEW //////////////////////////////////////////
struct AnimatingBindings_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        AnimatingBindings()
    }
}
