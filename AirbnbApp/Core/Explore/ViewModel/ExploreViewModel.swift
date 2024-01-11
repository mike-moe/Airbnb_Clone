

import Foundation
class ExploreViewModel: ObservableObject{
    @Published var listing = [Listing]()
    @Published var listingCopy = [Listing]()
    @Published var searchLocation = ""
    private let service :  ExploreService
    init(service: ExploreService)  {
        self.service = service
        Task { await fetchListings()}
    }
    func fetchListings () async{
        do{
            self.listing = try await service.fetchListing()
            self.listingCopy = listing
        }catch{
            print("You got an eerror for fetching data! \(error.localizedDescription)")
        }
    }
    func  updateListingForLocation(){
        let filteredLissting = listing.filter({
            $0.city.lowercased() == searchLocation.lowercased() ||
            $0.state.lowercased() == searchLocation.lowercased()
        })
        self.listing = filteredLissting.isEmpty ? listingCopy : filteredLissting
    }
}
