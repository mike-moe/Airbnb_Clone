
import SwiftUI

struct WhishlistView: View {
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading,spacing: 20){
              
                Text("Log in to view your wishlist.").font(.headline)
                Text("You can create, view, or edit wishlist once your logged in").font(.caption)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Log In").foregroundStyle(.white).fontWeight(.semibold).frame(maxWidth: .infinity,minHeight: 50).background(.pink).clipShape(RoundedRectangle(cornerRadius: 10)).padding(.vertical)
                    
                })
                Spacer()
            }.padding()
                .navigationTitle("Whishlists")
        }
       
     
    }
}
#Preview {
    WhishlistView()
}
