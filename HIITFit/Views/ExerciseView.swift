
import SwiftUI

struct ExerciseView: View {
    let videoNames = ["squat", "step-up", "burpee", "sun-salute"]
    let exerciseNames = ["Squat", "Step-up", "Burpee", "Sun-salute"]
    
    var exercise: Exercise {
        Exercise.exercises[index]
    }
    
    let index: Int
    
    var body: some View {
        VStack {
            HeaderView(exerciseName: exercise.exerciseName)
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

