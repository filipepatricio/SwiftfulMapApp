//
//  LocationsViewModel.swift
//  SwiftfulMapApp
//
//  Created by Filipe Patricio on 10/06/2024.
//

import Foundation

class LocationsViewModel: ObservableObject {
    @Published var locations: [Location]

    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}
