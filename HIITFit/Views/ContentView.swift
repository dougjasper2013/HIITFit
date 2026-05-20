
import SwiftUI

struct ContentView: View {
  var body: some View {
      TabView {
          WelcomeView() // was Text("Welcome")
          ForEach(0 ..< 4) { index in
              ExerciseView(index: index) // was Text("Exercise 1")
          }
      }
      .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
  }
}

#Preview {
  ContentView()
}
