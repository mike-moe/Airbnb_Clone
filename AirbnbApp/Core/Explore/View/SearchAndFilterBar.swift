
import SwiftUI

struct SearchAndFilterBar: View {
    @Binding var location : String
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            VStack(alignment:.leading){
                Text(location.isEmpty ? "Where to?" :   "\( location)").font(.footnote).fontWeight(.semibold)
                Text("Any Where - Any Week - Add Guest").font(.caption2).foregroundStyle(.gray)
                
            }
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "line.3.horizontal.decrease.circle").foregroundStyle(.black)
            }

        }.padding(.horizontal).padding(.vertical,10).overlay{
            Capsule().stroke(lineWidth: 0.5).foregroundStyle(.gray).shadow(color:.black.opacity(0.4),radius:8 )
        }.padding()
    }
}

#Preview {
    SearchAndFilterBar(location : .constant("Los Angeles"))
}
