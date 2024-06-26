//
//  ContentView.swift
//  NetworkAvabilityExample
//
//  Created by Mateja Opacic on 11/20/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        VStack {
            NetworkAvailabilityView()
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
