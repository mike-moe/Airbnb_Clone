
import SwiftUI

struct ListItemView: View {
    let listing :  Listing
    var body: some View {
        VStack(spacing:8){
            //images
            ListingCarouselView(listing: listing).frame(height: 320).clipShape(RoundedRectangle(cornerRadius: 10)).tabViewStyle(.page)
            //content
            HStack(alignment:.top){
                VStack(alignment: .leading){
                    Text(listing.title).fontWeight(.semibold).font(.headline)
                    Text(listing.address).foregroundStyle(.black)
                    Text("\(listing.city), \(listing.state)").foregroundStyle(.black)
                    Text("Nov 3 -12").foregroundStyle(.gray)
                    HStack(spacing:5){
                        
                        Text("$\(listing.pricePerNight)").fontWeight(.semibold)
                        Text("Night")
                    }
                }.foregroundStyle(.black)
                Spacer()
                HStack(spacing:3){
                    Image(systemName: "star.fill")
                    Text(String(format: "%.2f", listing.rating)).fontWeight(.semibold)
                    
                }.foregroundStyle(.black)
                
            }.font(.caption)
        }
    }
}

#Preview {
    ListItemView(listing : DeveloperPreview().listing[0])
}
