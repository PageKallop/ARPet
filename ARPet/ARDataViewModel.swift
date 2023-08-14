import Foundation
import UIKit
import Combine

final class ARDataViewModel: ObservableObject {
  let hour = Calendar.current.component(.hour, from: Date())
  @Published var buttonPressed = false
  
}
