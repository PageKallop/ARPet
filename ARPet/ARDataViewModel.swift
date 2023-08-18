import Foundation
import UIKit
import Combine
import SwiftUI

final class ARDataViewModel: UIView, ObservableObject {
  @Published var dropStringPressed = false
  @Published var jumpRobotPressed = false 
}

