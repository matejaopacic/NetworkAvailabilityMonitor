//
//  NetworkAvailabilityView.swift
//  NetworkAvabilityExample
//
//  Created by Mateja Opacic on 11/20/22.
//

import SwiftUI

struct NetworkAvailabilityView: View {
    @StateObject var networkMonitor: NetworkAvailabilityMonitor = NetworkAvailabilityMonitor()
    var text: String
    var warningColor: Color
    
    init(text: String = "Problem with internet", warningColor: Color = .red) {
        self.text = text
        self.warningColor = warningColor
    }
    
    var body: some View {
        VStack{
            if !networkMonitor.isConnected{
                HStack{
                    Label(text, systemImage: "wifi.slash")
                        .foregroundColor(warningColor)
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 50)
    }
}

struct NetworkAvailabilityView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkAvailabilityView()
    }
}

import Network
class NetworkAvailabilityMonitor: ObservableObject{
    private let networkMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue(label: "NetworkAvailabilityMonitor")
    var isConnected = false
    
    init(isConnected: Bool = false) {
        self.isConnected = isConnected
        networkMonitor.pathUpdateHandler = {path in
            self.isConnected = path.status == .satisfied
            Task{
                await MainActor.run{
                    self.objectWillChange.send()
                }
            }
        }
        networkMonitor.start(queue: workerQueue)
    }
}
