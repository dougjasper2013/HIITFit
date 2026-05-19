
import SwiftUI

struct ContentView: View {
  var body: some View {
      TabView {
          Text("Welcome!")
          Text("Exercise 1")
          Text("Exercise 2")              
      }
      .tabViewStyle(PageTabViewStyle())
  }
}

#Preview {
  ContentView()
}
