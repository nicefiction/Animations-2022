/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/building-custom-transitions-using-viewmodifier

import SwiftUI



struct PivotColorModifier: ViewModifier {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let angle: Angle
    let anchor: UnitPoint
    
    
    
    // MARK: - COMPUTED PROPERTIES
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    func body(content: Content)
    -> some View {
        
        return content
                .rotationEffect(angle, anchor: anchor)
                .clipped()
    }
    
    
    
    // MARK: - HELPER METHODS
}






extension AnyTransition {
    
    static var pivotColor: AnyTransition {
        
        return .modifier(active: PivotColorModifier.init(angle: Angle.degrees(-90),
                                                         anchor: UnitPoint.topLeading),
                         identity: PivotColorModifier.init(angle: Angle.degrees(0.00),
                                                           anchor: UnitPoint.topLeading))
    }
}






struct CustomTransitions: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    @State private var isTapped: Bool = false
    
    
    
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(.orange)
            if isTapped {
                Rectangle()
                    .foregroundColor(.pink)
                    .transition(.pivotColor)
            }
        }
        .frame(width: 200, height: 200)
        .onTapGesture {
            withAnimation {
                isTapped.toggle()
            }
        }
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}






// PREVIEW //////////////////////////////////////////
struct CustomTransitions_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        CustomTransitions()
    }
}
