//
//  ExerciseView.swift
//  MyWorkout
//
//  Created by Nattapong Chaowhacharoenpong on 18/9/2564 BE.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    @State private var showHistory = false
    @State private var showSuccess = false
    
    @State private var timerDone = false
    @State private var showTimer = false
    
    @Binding var selectedTab: Int
    
    @EnvironmentObject var history: HistoryStore
    let index: Int
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(selectedTab: $selectedTab,titleText: Exercise.exercises[index].exerciseName)
                
                if let url = Bundle.main.url(forResource: Exercise.exercises[index].videoName, withExtension: "mp4") {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(height: geometry.size.height * 0.45)
                } else {
                    Text("Couldn't find \(Exercise.exercises[index].videoName).mp4")
                        .foregroundColor(.red)
                }
                
                HStack(spacing: 150) {
                    Button(NSLocalizedString("Start", comment: "begin exercise")) { showTimer.toggle() }
                    
                    Button(NSLocalizedString("Done", comment: "mark as finished")) {
                        history.addDoneExercise(Exercise.exercises[index].exerciseName)
                        timerDone = false
                        showTimer.toggle()
                        history.doneExercise.append(selectedTab)
                        if history.doneExercise.count == Exercise.exercises.count {
                            showSuccess.toggle()
                        } else {
                            for i in selectedTab...Exercise.exercises.count {
                                if !history.doneExercise.contains(i) {
                                    selectedTab = i
                                    break
                                }
                                if i == Exercise.exercises.count - 1 {
                                    selectedTab = undoneExercise()
                                    break
                                }
                            }
                        }
                    }
                    .disabled(!timerDone)
                    .sheet(isPresented: $showSuccess) {
                        SuccessView(selectedTab: $selectedTab)
                    }
                }
                .font(.title3)
                .padding()
                
                if showTimer {
                    TimerView(timerDone: $timerDone)
                }
                
                Spacer()
                
                RatingView(exerciseIndex: index)
                    .padding()
                
                Button(NSLocalizedString("History", comment: "view user activity")) { showHistory.toggle() }
                    .padding(.bottom)
                    .sheet(isPresented: $showHistory) {
                        HistoryView(showHistory: $showHistory)
                    }
            }
        }
    }
    
    func undoneExercise() -> Int {
        for i in 0...Exercise.exercises.count {
            if !history.doneExercise.contains(i) {
                return i
            }
        }
        return 8
    }
    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(selectedTab: .constant(1),index: 1)
            .environmentObject(HistoryStore())
    }
}
