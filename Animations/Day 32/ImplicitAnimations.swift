/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/creating-implicit-animations
/// implicit animations always need to watch a particular value.

import SwiftUI



struct ImplicitAnimations: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    @State private var animationAmount: Double = 1.00
    /// OLIVIER: `animationAmount` needs to be set to `1`
    /// because otherwise .scaleEffect would be set to `0`
    /// which would make the graphic dissappear.
    
    
    
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(40)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .blur(radius: (animationAmount - 1) * 3)
        .scaleEffect(animationAmount)
        .animation(.default,
                   value: animationAmount)
        
        
        Button(action: {
            animationAmount += 1
        }, label: {
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.red)
                Text("Hello World")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.white)
            }
            .scaleEffect(animationAmount)
            .blur(radius: (animationAmount - 1) * 3)
            .animation(.default, value: animationAmount)
            
        })
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}






// PREVIEW ///////////////////////////////////////////
struct ImplicitAnimations_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        ImplicitAnimations()
    }
}
