import SwiftUI
import RealityKit
import Combine

struct ContentView : View {
  var arView = ARViewContainer()
  @ObservedObject var model = ContentViewModel()
  @State private var refresh = false
  
  var body: some View {
    let screenSize = UIScreen.main.bounds.size
    VStack {
      Text(String(format: NSLocalizedString("My Pet Robot", comment: "")))
        .foregroundColor(.black)
        .font(.headline.bold())
        .frame(width: screenSize.width, height: 50, alignment: .center)
      HStack {
        VStack {
          Text(String(format: NSLocalizedString("Health", comment: "")))
            .foregroundColor(.black)
            .font(.subheadline.bold())
          HStack {
            ForEach(0..<model.healthArray.count, id: \.self) { imageIdx in
              Image(systemName: "cross.circle.fill")
                .foregroundColor(Color.red)
                .padding(5)
                .frame(width: 15, height: 5, alignment: .center)
            }
            .onReceive(model.$healthArray) { _ in
              refresh.toggle()
            }
          }
        }
        VStack {
          Text(String(format: NSLocalizedString("Happiness", comment: "")))
            .foregroundColor(.black)
            .font(.subheadline.bold())
          HStack {
            ForEach(0..<model.happinessArray) { imageIdx in
              Image(systemName: "smiley")
                .foregroundColor(Color.green)
                .padding(5)
                .frame(width: 15, height: 5, alignment: .center)
            }
          }
        }
        VStack {
          Text(String(format: NSLocalizedString("Hunger", comment: "")))
            .foregroundColor(.black)
            .font(.subheadline.bold())
          HStack {
            ForEach(0..<model.hungerArray.count, id: \.self) { imageIdx in
              Image(systemName: "battery.100.bolt")
                .foregroundColor(.blue)
                .padding(5)
                .frame(width: 15, height: 5, alignment: .center)
            }
            .onReceive(model.$hungerArray) { _ in
              refresh.toggle()
            }
          }
            .frame(width: 75, height: 5, alignment: .center)
        }
      }.frame(minWidth: 0, maxWidth: .infinity)
      arView.edgesIgnoringSafeArea(.all)
      HStack {
        Button(action: {
          arView.triggerAction()
          if model.hungerArray.count == 5 {
            model.healthArray.removeLast()
          } else {
            model.hungerArray.append(Image(systemName: "battery.100.bolt"))
          }
        }) {
          Text("FEED THE ROBOT")
            .foregroundColor(.black)
            .font(.subheadline.bold())
            .frame(width: 75, height: 55, alignment: .center)
        }.background(Color.gray)
          .clipShape(Capsule())
          .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .shadow(color: .gray, radius: 2, x: 0, y: 2))
      }
    }.background(Color.white)
  }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
#endif
