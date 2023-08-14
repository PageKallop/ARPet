import SwiftUI
import RealityKit
import Combine

struct ContentView : View {
  let arView = ARViewContainer()

  var heartArray = [Image(systemName: "heart.fill"),
                    Image(systemName: "heart.fill")]
  var happinessArray = [Image(systemName: "smiley"),
                    Image(systemName: "smiley")]
  var hungerArray = [Image(systemName: "gear"),
                    Image(systemName: "gear")]

  var body: some View {
    let screenSize = UIScreen.main.bounds.size
    VStack {
      Text(String(format: NSLocalizedString("My Pet Robot", comment: "")))
        .frame(width: screenSize.width, height: 50, alignment: .center)
      HStack {
        VStack {
          Text(String(format: NSLocalizedString("Health", comment: "")))
          HStack {
            ForEach(0..<heartArray.count) { imageIdx in
              Image(systemName: "heart.fill")
                .padding(10)
                .frame(width: 5, height: 5, alignment: .center)
            }
          }
        }
        VStack {
          Text(String(format: NSLocalizedString("Happiness", comment: "")))
          HStack {
            ForEach(0..<happinessArray.count) { imageIdx in
              Image(systemName: "smiley")
                .padding(10)
                .frame(width: 5, height: 5, alignment: .center)
            }
          }
        }
        VStack {
          Text(String(format: NSLocalizedString("Hunger", comment: "")))
          HStack {
            ForEach(0..<hungerArray.count) { imageIdx in
              Image(systemName: "smiley")
                .padding(10)
                .frame(width: 5, height: 5, alignment: .center)
            }
          }
        }
      }
      arView.edgesIgnoringSafeArea(.all)
      HStack {
        Button(action: {
          arView.triggerAction()
        }) {
          Text("FEED THE ROBOT")
            .foregroundColor(.red)
            .font(.subheadline.bold())
            .frame(width: 75, height: 50, alignment: .center)
        }
        Spacer()
        Text("This apps")
          .frame(width: 75, height: 50, alignment: .center)
      }
    }
  }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
#endif
