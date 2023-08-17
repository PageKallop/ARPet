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
        .frame(width: screenSize.width, height: 50, alignment: .center)
      HStack {
        VStack {
          Text(String(format: NSLocalizedString("Health", comment: "")))
          HStack {
            ForEach(0..<model.healthArray.count, id: \.self) { imageIdx in
              Image(systemName: "heart.fill")
                .padding(5)
                .frame(width: 15, height: 5, alignment: .center)
            }
            .onReceive(model.$healthArray) { _ in
              refresh.toggle()
            }
          }.background(Color.purple)
        }
        VStack {
          Text(String(format: NSLocalizedString("Happiness", comment: "")))
          HStack {
            ForEach(0..<model.happinessArray) { imageIdx in
              Image(systemName: "smiley")
                .padding(5)
                .frame(width: 15, height: 5, alignment: .center)
            }
          }.background(Color.red)
        }
        VStack {
          Text(String(format: NSLocalizedString("Hunger", comment: "")))
          HStack {
            ForEach(0..<model.hungerArray.count, id: \.self) { imageIdx in
              Image(systemName: "smiley")
                .padding(5)
                .frame(width: 15, height: 5, alignment: .center)
            }
            .onReceive(model.$hungerArray) { _ in
              refresh.toggle()
            }
          }.background(Color.blue)
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
            model.hungerArray.append(Image(systemName: "smiley"))
          }
        }) {
          Text("FEED THE ROBOT")
            .foregroundColor(.black)
            .font(.headline.bold())
            .frame(width: 75, height: 50, alignment: .center)
        }.padding()
          .background(Color.teal)
      }.background(Color.white)
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
