import RealityKit
import Foundation
import SwiftUI
import ARKit

struct ARViewContainer: UIViewRepresentable {
  @StateObject var ArDataModel = ARDataViewModel()
  let arView = ARView(frame: .zero)
  let robotScene = try! Experience.loadRobotScene()
  
  func addCoaching() {
    let coachingOverlay = ARCoachingOverlayView()
    coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    coachingOverlay.goal = .horizontalPlane
    coachingOverlay.session = self.arView.session
    self.arView.addSubview(coachingOverlay)
  }

  func makeUIView(context: Context) -> ARView {
    arView.scene.anchors.append(robotScene)
    robotScene.spring?.isEnabled = false
    addCoaching()
    return arView
    
  }
  
  func triggerAction() {
    robotScene.spring?.isEnabled = true
    if let spring = robotScene.scene?.anchors[0] as? Experience.RobotScene {
      spring.notifications.triggerAction.post()
      spring.actions.actionDone.onAction = { spring in
        self.ArDataModel.dropStringPressed = true
        robotScene.spring?.isEnabled = false
      }
    }
//    robotScene.spring?.isEnabled = false
  }
  
  func jumpNotification() {
    if let jump = robotScene.scene?.anchors[0] as? Experience.RobotScene {
      jump.notifications.triggerAction.post()
      jump.actions.Didjump.onAction = { jump in
        self.ArDataModel.jumpRobotPressed = true
        print("🎂 🎂 🎂 🎂 🎂 🎂")
      }
    }
  }
  
  func updateUIView(_ uiView: ARView, context: Context) {}
  
}
