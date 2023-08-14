import RealityKit
import Foundation
import SwiftUI

struct ARViewContainer: UIViewRepresentable {
  var ArDataModel = ARDataViewModel()
  let arView = ARView(frame: .zero)
  let robotScene = try! Experience.loadRobotScene()

  func makeUIView(context: Context) -> ARView {
    
    // Load the "Box" scene from the "Experience" Reality File
    
    // Add the box anchor to the scene
    arView.scene.anchors.append(robotScene)
    robotScene.spring?.isEnabled = false

    return arView
    
  }
  
  func triggerAction() {
    robotScene.spring?.isEnabled = true
    if let spring = robotScene.scene?.anchors[0] as? Experience.RobotScene {
      spring.notifications.triggerAction.post()
      spring.actions.actionDone.onAction = { spring in
        self.ArDataModel.buttonPressed = true
      }
    }
    robotScene.spring?.isEnabled = false
  }
  
  func updateUIView(_ uiView: ARView, context: Context) {}
  
}
