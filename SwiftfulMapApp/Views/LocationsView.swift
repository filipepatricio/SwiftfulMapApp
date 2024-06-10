//
//  LocationsView.swift
//  SwiftfulMapApp
//
//  Created by Filipe Patricio on 10/06/2024.
//

import MapKit
import SwiftUI

struct LocationsView: View {
    @EnvironmentObject private var vm: LocationsViewModel

    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
