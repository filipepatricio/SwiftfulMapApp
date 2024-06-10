//
//  SwiftfulMapAppApp.swift
//  SwiftfulMapApp
//
//  Created by Filipe Patricio on 10/06/2024.
//

import SwiftUI

@main
struct SwiftfulMapApp: App {
    @StateObject private var vm = LocationsViewModel()

    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
