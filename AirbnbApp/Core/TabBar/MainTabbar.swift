

import SwiftUI

struct MainTabbar: View {
    var body: some View {
        TabView{
            ExploreView().tabItem { Label("Explore", systemImage: "magnifyingglass") }
            WhishlistView().tabItem { Label("Wishlist", systemImage: "heart") }
            ProfileView().tabItem { Label("Profile", systemImage: "person")}
            
        }
    }
}

#Preview {
    MainTabbar()
}
