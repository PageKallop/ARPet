import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
  @Published var healthArray = [Image(systemName: "cross.circle.fill"),
                               Image(systemName: "cross.circle.fill"),
                               Image(systemName: "cross.circle.fill")]
  @Published var happinessArray = 3
  @Published var hungerArray = [Image(systemName: "battery.100.bolt"),
                                Image(systemName: "battery.100.bolt"),
                                Image(systemName: "battery.100.bolt")]
  
  let hour = Calendar.current.component(.hour, from: Date())
}
