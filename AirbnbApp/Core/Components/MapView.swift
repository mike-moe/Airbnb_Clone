
import SwiftUI
import MapKit
struct MapView: View {
    var body: some View {
        Map().frame(height: 250).clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    MapView()
}
