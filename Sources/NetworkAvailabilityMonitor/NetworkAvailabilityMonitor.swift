import Network
import SwiftUI

public class NetworkAvailabilityMonitor: ObservableObject{
    private let networkMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue(label: "NetworkAvailabilityMonitor")
    public var isConnected = false
    
    public init(isConnected: Bool = false) {
        self.isConnected = isConnected
        networkMonitor.pathUpdateHandler = {path in
            Task{
                await MainActor.run{
                    self.objectWillChange.send()
                    self.isConnected = path.status == .satisfied
                }
            }
        }
        networkMonitor.start(queue: workerQueue)
    }
}
