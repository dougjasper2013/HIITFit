
import SwiftUI
import AVKit

struct ExerciseView: View {
    let videoNames = ["squat", "step-up", "burpee", "sun-salute"]
    let exerciseNames = ["Squat", "Step-up", "Burpee", "Sun-salute"]
    
    var exercise: Exercise {
        Exercise.exercises[index]
    }
    
    let index: Int
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(exerciseName: exercise.exerciseName)
                    .padding(.bottom)
                if let url = Bundle.main.url(forResource: videoNames[index], withExtension: "mp4") {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(height: geometry.size.height * 0.45)
                } else {
                    Text("Coulldn't find \(exercise.videoName).mp4").foregroundColor(.red)
                }
                Text("Timer")
                Text("Start/Done Button")
                Text("Rating")
                Text("History Button")
            }
        }
    }
}

#Preview {
    ExerciseView(index: 0)
}

