//
//  LocationsViewModel.swift
//  SwiftfulMapApp
//
//  Created by Filipe Patricio on 10/06/2024.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    // All loaded locations
    @Published var locations: [Location]

    // Current location on the map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }

    // Current region on map
    @Published var mapRegion: MKCoordinateRegion = .init()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)

    // Show list of locations
    @Published var showLocationsList: Bool = false

    // Show location detail via sheet
    @Published var sheetLocation: Location? = nil {
        didSet {}
    }

    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        updateMapRegion(location: mapLocation)
    }

    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates,
                                           span: mapSpan)
        }
    }

    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }

    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }

    func nextButtonPressed() {
        // Get the current index
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
            print("Could not find current index in locations array! Should never happen.")
            return
        }

        // Check if the currrentIndex is valid
        let nextIndex = currentIndex < locations.count - 1 ? locations.index(after: currentIndex) : 0
        showNextLocation(location: locations[nextIndex])
    }
}
