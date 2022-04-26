/// SOURCE:
///

import SwiftUI



struct UsingTransitions: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    @State private var dragAmount: CGSize = CGSize.zero
    
    
    
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
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
                    withAnimation {
                        dragAmount = CGSize.zero
                    }
                }
        )
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
