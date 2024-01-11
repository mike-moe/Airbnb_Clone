
import SwiftUI
import MapKit
struct ListingDetailView: View {
    @Environment(\.dismiss) private var dismiss
    let listing :  Listing
    @State var cameraPosition: MapCameraPosition
    init(listing: Listing){
        self.listing = listing
        let region = MKCoordinateRegion(center:listing.city == "Los Angeles" ? .losAngeles : .miami, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1) )
        self._cameraPosition = State(initialValue: .region(region))
    }
    var body: some View {
        ScrollView{
            
            ZStack(alignment:.topLeading){
                
                ListingCarouselView(listing: listing).frame(minHeight: 300 ).tabViewStyle(.page)
                Button {
                   dismiss()
                } label: {
                    Image(systemName: "chevron.left").foregroundColor(.black).background(Circle().fill(.white).frame(width: 32,height: 32)).padding(60)
                }

            }
            VStack(alignment:.leading){
                Text(listing.title).fontWeight(.bold).font(.title)
                VStack (alignment:.leading){
                    HStack(spacing:3){
                        Image(systemName: "star.fill")
                        Text(String(format: "%.2f", listing.rating)).fontWeight(.semibold)
                        Text(" – ")
                        Text("28 reviews").underline()
                        
                    }.foregroundStyle(.black)
                    Text("\(listing.city), \(listing.state)").fontWeight(.semibold)
                }.font(.footnote)
            }.frame(maxWidth: .infinity,alignment: .leading).padding()
            Divider().padding(.horizontal)
            //host info view
            HStack(alignment:.top){
                VStack(alignment:.leading){
                    Text("Entire villa hosted by \(listing.ownerName)").font(.headline).frame(width: 250,alignment: .leading)
                    HStack(spacing:2){
                        Text("\(listing.numberOfGuests) Guests")
                        Text(" – ")
                        Text("\(listing.numberOfBedrooms) Bedrooms") 
                        Text(" – ")
                        Text("\(listing.numberOfBathromms) Bathrooms")
                        Text(" – ")
                        Text("\(listing.numberOfBeds) Beds")
                    }.font(.caption)
                }.frame(width: 320,alignment: .leading)
                Spacer()
                Image(listing.ownerImageUrl).resizable().frame(width: 60,height: 60).clipShape(Circle())
            }.padding()
            Divider().padding(.horizontal)
            // listing features
            VStack(alignment:.leading){
                ForEach(listing.features){
                    feature in HStack{
                        Image(systemName: feature.image)
                        VStack(alignment:.leading,spacing: 1){
                            Text(feature.title).font(.caption).fontWeight(.semibold)
                            Text(feature.subtitle).font(.caption).foregroundStyle(.gray)
                        }
                    }.padding(.vertical,2)
                }
            }.frame(maxWidth: .infinity,alignment: .leading).padding()
            Divider().padding(.horizontal)
            // sleeping area
            VStack(alignment: .leading, content: {
                Text("Where you'll sleep").font(.headline).padding(.horizontal)
                ScrollView(.horizontal,showsIndicators: false){
                    HStack{
                        ForEach(1...listing.numberOfBedrooms, id:\.self){ item in
                            VStack{
                                Image(systemName: "bed.double")
                                Text("Bedroom \(item)").font(.caption)
                            }.frame(width: 130,height: 100).overlay{
                                RoundedRectangle(cornerRadius: 12).stroke(lineWidth:1)
                            }
                        }
                    }.padding(.horizontal)
                }
            })
            Divider().padding()
            // MARK: Amenities
            HStack{
                
                VStack(alignment:.leading,spacing: 8){
                    Text("What this place offers?").font(.headline)
                    ForEach(listing.amenities){ amenity in
                        HStack(){
                            Image(systemName: amenity.imageName).frame(width: 32)
                            Text(amenity.title).font(.footnote)
                        }
                        
                    }
                    
                    
                }.padding()
                Spacer()
            }
            // MARK: mapview
            Map(position: $cameraPosition).frame(height: 200).padding()
        }.toolbar(.hidden, for: .tabBar).ignoresSafeArea().padding(.bottom,64)
            .overlay(alignment:.bottom){
                VStack{
                    Divider()
                    HStack(alignment:.center){
                        VStack(alignment:.leading){
                            Text("$\(listing.pricePerNight)").fontWeight(.bold)
                            Text("Total before Taxes").font(.caption)
                            Text("Oct 15 - 20").font(.caption).underline()
                        }
                       Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Reserve").font(.footnote).foregroundStyle(.white).fontWeight(.bold).padding(8).frame(width: 120, height: 40, alignment: .center).background(.pink).clipShape(Capsule()).shadow(color: .gray,radius: 2).background(Color.white)
                        })
                    }.frame(maxWidth: .infinity).padding(.horizontal,50)
                }.background(.white)
            }.background(.white)
        
    }
}

#Preview {
    ListingDetailView(listing: DeveloperPreview().listing[0])
}
