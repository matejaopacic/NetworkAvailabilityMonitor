//
//  NetworkAvailabilityView.swift
//  NetworkAvabilityExample
//
//  Created by Mateja Opacic on 11/20/22.
//

import SwiftUI

public struct NetworkAvailabilityView: View {
    var networkMonitor: NetworkAvailabilityMonitor
    var text: String
    var warningColor: Color
    
    public init(text: String = "Problem with internet", warningColor: Color = .red, networkMonitor: NetworkAvailabilityMonitor = NetworkAvailabilityMonitor()) {
        self.networkMonitor = networkMonitor
        self.text = text
        self.warningColor = warningColor
    }
    
    public var body: some View {
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
