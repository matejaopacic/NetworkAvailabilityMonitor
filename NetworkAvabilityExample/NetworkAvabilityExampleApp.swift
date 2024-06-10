//
//  NetworkAvabilityExampleApp.swift
//  NetworkAvabilityExample
//
//  Created by Mateja Opacic on 11/20/22.
//

import SwiftUI

@main
struct NetworkAvabilityExampleApp: App {
    @StateObject private var networkAvabilityMonitor = NetworkAvailabilityMonitor()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
