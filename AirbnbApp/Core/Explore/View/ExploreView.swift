

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    var body: some View {
        NavigationStack{
          
            
            if showDestinationView {
                DestinationSearchView(show: $showDestinationView,viewModel: viewModel)
            } else {
                ScrollView{
                    SearchAndFilterBar(location: $viewModel.searchLocation).onTapGesture {
                        withAnimation(.snappy){
                            showDestinationView.toggle()
                        }
                    }
                    LazyVStack(spacing: 32){
                        ForEach(viewModel.listing){ listing in
                            NavigationLink(value: listing) {
                                ListItemView(listing : listing)
                                    .frame(height: 435).clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }.padding()
                }
                .navigationDestination(for: Listing.self) { listing in
                    ListingDetailView(listing:listing).navigationBarBackButtonHidden()
                    
                   
                }
            }
           
                
            }
        }
    }

#Preview {
    ExploreView()
}
