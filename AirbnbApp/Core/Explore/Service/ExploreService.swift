

import Foundation
class ExploreService {
    func fetchListing() async throws-> [Listing]{
        return DeveloperPreview().listing
    }
}
