/// Copyright (c) 2025 Kodeco LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct HistoryView: View {
  @EnvironmentObject var history: HistoryStore
  @Binding var showHistory: Bool
  @State private var addMode = false

  var headerView: some View {
    HStack {
      Button {
        addMode = true
      } label: {
        Image(systemName: "plus")
      }
      .padding(.trailing)
      EditButton()
      Spacer()
      Text("History")
        .font(.title)
      Spacer()
      Button {
        showHistory.toggle()
      } label: {
        Image(systemName: "xmark.circle")
      }
      .font(.title)
    }
  }

  func dayView(day: ExerciseDay) -> some View {
    DisclosureGroup {
      BarChartDayView(day: day)
        .deleteDisabled(true)
    } label: {
      Text(day.date.formatted(as: "d MMM YYYY"))
        .font(.headline)
    }
  }

  func exerciseView(day: ExerciseDay) -> some View {
    ForEach(day.uniqueExercises, id: \.self) { exercise in
      Text(exercise)
        .badge(day.countExercise(exercise: exercise))
    }
  }

  var body: some View {
    VStack {
      Group {
        if addMode {
          Text("History")
            .font(.title)
        } else {
          headerView
        }
      }
      .padding()
      List($history.exerciseDays, editActions: [.delete]) { $day in
        dayView(day: day)
      }
      if addMode {
        AddHistoryView(addMode: $addMode)
          .background(Color.primary.colorInvert()
            .shadow(color: .primary.opacity(0.5), radius: 7))
      }
    }
    .onDisappear {
      try? history.save()
    }
  }
}

struct HistoryView_Previews: PreviewProvider {
  static var history = HistoryStore(preview: true)
  static var previews: some View {
    HistoryView(showHistory: .constant(true))
      .environmentObject(history)
  }
}
