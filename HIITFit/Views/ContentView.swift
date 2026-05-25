
import SwiftUI

struct ContentView: View {
  var body: some View {
      TabView {
          WelcomeView() // was Text("Welcome")
          ForEach(Exercise.exercises.indices, id: \.self) { index in
              ExerciseView(index: index) // was Text("Exercise 1")
          }
      }
      .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
  }
}

#Preview {
  ContentView()
}
