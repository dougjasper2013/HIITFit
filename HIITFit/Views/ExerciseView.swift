
import SwiftUI

struct ExerciseView: View {
    let videoNames = ["squat", "step-up", "burpee", "sun-salute"]
    let exerciseNames = ["Squat", "Step-up", "Burpee", "Sun-salute"]
    
    let index: Int
    
    var body: some View {
        VStack {
            HeaderView(exerciseName: exerciseNames[index])
            Text("Video Player")
            Text("Timer")
            Text("Start/Done Button")
            Text("Rating")
            Text("History Button")
        }
    }
}

#Preview {
    ExerciseView(index: 0)
}

