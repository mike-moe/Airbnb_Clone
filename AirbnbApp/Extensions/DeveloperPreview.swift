

import Foundation

class DeveloperPreview{
    var listing : [Listing] = [
        .init(
            id: NSUUID().uuidString, ownerId: NSUUID().uuidString, ownerName: "Jhon Smith", ownerImageUrl: "person", numberOfBedrooms: 4, numberOfBathromms: 2, numberOfGuests: 1, numberOfBeds: 2, pricePerNight: 359, latitude: 25.7850, longitude: -80.1936, city: "Miami", address: "124 Main Street", state: "Florida", title: "Miami Villa", rating: 4.32, features: [.selfCheckIn,.superHost], amenities: [.kitchen,.alarmSystem,.office,.pool], type: .villa,imageUrl: ["listing-1","listing-2","listing-3","listing-4"]
        ),
        .init(
                id: NSUUID().uuidString, ownerId: NSUUID().uuidString, ownerName: "Joe Fred", ownerImageUrl: "person", numberOfBedrooms: 4, numberOfBathromms: 2, numberOfGuests: 4, numberOfBeds: 4, pricePerNight: 700, latitude: 34.2, longitude: -118.0426, city: "Los Angeles", address: "124 Malibu Street", state: "California", title: "Malibu Home", rating: 4.99, features: [.selfCheckIn,.superHost], amenities: [.kitchen,.alarmSystem,.office,.pool,.wifi], type: .house,imageUrl: ["listing-1","listing-2","listing-3","listing-4"]
            ),
        .init(
            id: NSUUID().uuidString, ownerId: NSUUID().uuidString, ownerName: "Jhon Smith", ownerImageUrl: "person", numberOfBedrooms: 4, numberOfBathromms: 2, numberOfGuests: 1, numberOfBeds: 2, pricePerNight: 359, latitude: 25.7850, longitude: -80.1936, city: "Miami", address: "124 Main Street", state: "Florida", title: "Miami Villa", rating: 4.32, features: [.selfCheckIn,.superHost], amenities: [.kitchen,.alarmSystem,.office,.pool], type: .villa, imageUrl: ["listing-1","listing-2","listing-3","listing-4"]
        ),
        
    ]
}
