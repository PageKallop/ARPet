import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
  @Published var healthArray = [Image(systemName: "heart.fill"),
                               Image(systemName: "heart.fill"),
                               Image(systemName: "heart.fill")]
  @Published var happinessArray = 3
  @Published var hungerArray = [Image(systemName: "smiley"),
                                Image(systemName: "smiley"),
                                Image(systemName: "smiley")]
  
  let hour = Calendar.current.component(.hour, from: Date())
}
