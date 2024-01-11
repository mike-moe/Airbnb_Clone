

import SwiftUI

struct ListingCarouselView: View {
    let listing :  Listing
    var body: some View {
        TabView{
            ForEach(listing.imageUrl.shuffled(),id:\.self){
                image in   Image(image).resizable().aspectRatio(contentMode: .fill)
            }
           
        }
    }
}

#Preview {
    ListingCarouselView(listing: DeveloperPreview().listing[0])
}
