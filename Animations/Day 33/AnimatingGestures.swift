/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/animating-gestures

import SwiftUI



struct AnimatingGestures: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    @State private var dragAmount: CGSize = CGSize.zero
    
    
    
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        LinearGradient(colors: [.pink, .red],
                       startPoint: .leading,
                       endPoint: .top)
        .frame(width: 200, height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 42))
        .offset(dragAmount)
        /// As you drag around,
        /// the card will move to the drag location with a slight delay because of the spring animation,
        /// but it will also gently overshoot if you make sudden movements.
//        .animation(.spring(),
//                   value: dragAmount)
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in dragAmount = .zero }
        )
        
        LinearGradient(colors: [.pink, .orange],
                       startPoint: .leading,
                       endPoint: .top)
        .frame(width: 200, height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 40.00))
        .offset(dragAmount)
        .gesture(
            DragGesture()
                .onChanged { (dragGestureValue: DragGesture.Value) in
                    dragAmount = dragGestureValue.translation
                }
                .onEnded { (dragGestureValue: DragGesture.Value) in
                    withAnimation(.spring()) {
                        dragAmount = CGSize.zero
                    }
                    /// Now the card will follow your drag immediately
                    /// (because that’s not being animated),
                    /// but when you release it will animate.
                }
        )
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}






// PREVIEW //////////////////////////////////////////
struct AnimatingGestures_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        AnimatingGestures()
    }
}
