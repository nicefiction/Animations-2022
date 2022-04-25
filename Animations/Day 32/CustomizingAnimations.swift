// MARK: - LIBRARIES
import SwiftUI



struct CustomizingAnimations: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    @State private var animationAmount: Double = 1.00
    
    
    
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
    var body: some View {
        
        VStack {
            Button("Tap Me") {
                animationAmount += 1
            }
            .foregroundColor(.white)
            .font(.headline)
            .padding(40)
            .background(.blue)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            .blur(radius: (animationAmount - 1) * 3)
            .animation(.default,
                       value: animationAmount)
            
            Button("Tap Me") {
                animationAmount += 1
            }
            .foregroundColor(.white)
            .font(.headline)
            .padding(40)
            .background(.red)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            .blur(radius: (animationAmount - 1) * 3)
            .animation(.easeInOut(duration: 2),
                       value: animationAmount)
            /// When we say `.easeInOut(duration: 2) `
            /// we’re actually creating an instance of an `Animation` struct that has its own set of modifiers.
            /// So, we can attach modifiers directly to the animation to add a delay like this:
            
            Button("Tap Me") {
                animationAmount += 1
            }
            .foregroundColor(.white)
            .font(.headline)
            .padding(40)
            .background(.yellow)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            .blur(radius: (animationAmount - 1) * 3)
            .animation(
                .easeInOut(duration: 2)
                .repeatCount(3, autoreverses: false),
                value: animationAmount
            )
            
            Button("Tap Me") {
                animationAmount += 1
            }
            .foregroundColor(.white)
            .font(.headline)
            .padding(40)
            .background(.orange)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            .blur(radius: (animationAmount - 1) * 3)
            .animation(
                .easeInOut(duration: 3)
                .repeatForever(autoreverses: false),
                value: animationAmount
            )
            
            Button("Tap Me") {
                // animationAmount += 1
            }
            .foregroundColor(.white)
            .padding(40)
            .background(.mint)
            .clipShape(Circle())
            .overlay(
                Circle()
                    // .stroke(.green)
                    .strokeBorder(.green, lineWidth: 3.0)
                    //.foregroundColor(.green)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeInOut(duration: 3)
                        .repeatForever(autoreverses: false),
                        value: animationAmount
                    )
            )
            .onAppear {
                animationAmount = 2
            }
        }
        
        
    }
}






// PREVIEW //////////////////////////////////////////////
struct CustomizingAnimations_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        CustomizingAnimations()
    }
}
