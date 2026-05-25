
import SwiftUI

struct HistoryView: View {
    
    let today = Date()
    let yesterday = Date().addingTimeInterval(-86400) // seconds
    
    let exercises1 = ["Squat", "Step Up", "Burpee", "Sun Salute"]
    let exercises2 = ["Squat", "Step Up", "Burpee"]
    
    var body: some View {
        VStack {
            Text("History")
                .font(.title)
                .padding()
            //Exercise History
            
            Form {
                Section(header:
                            Text(today.formatted(as: "MMM d"))
                    .font(.headline)) {
                        // Section content
                        ForEach(exercises1, id: \.self) { exercise in
                            Text(exercise)                        }
                    }
                Section(header:
                            Text(yesterday.formatted(as: "MMM d"))
                    .font(.headline)) {
                        // Section content
                        ForEach(exercises2, id: \.self) { exercise in
                            Text(exercise)                        }
                    }
            }
        }
        
        
        
    }
}

#Preview {
    HistoryView()
}
