/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/showing-and-hiding-views-with-transitions

import SwiftUI



struct UsingTransitions: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    @State private var isShowingCircle: Bool = false
    
    
    
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        VStack(spacing: 50) {
            Button("Tap Me") {
                withAnimation {
                    isShowingCircle.toggle()
                }
            }
            if isShowingCircle {
                Circle()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.orange)
                    // .transition(.scale)
                /// `.asymmetric`lets us use one transition when the view is being shown
                /// and another when it’s disappearing.
                    .transition(.asymmetric(insertion: .scale,
                                            removal: .opacity))
            }
        }
    }
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}






// PREVIEW /////////////////////////////////////////
struct UsingTransitions_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        UsingTransitions()
    }
}
