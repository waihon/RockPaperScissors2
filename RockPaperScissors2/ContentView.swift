//
//  ContentView.swift
//  RockPaperScissors2
//
//  Created by Waihon Yew on 04/05/2022.
//

import SwiftUI

struct ContentView: View {
    static let moves = ["Rock", "Paper", "Scissors"]
    static let movesEmoji = ["🪨", "📄", "✂"]
    static let maxQuestions = 10

    @State var currentChoice = Int.random(in: 0...2)
    @State var playerShouldWin = Bool.random()

    @State private var showingScore = false
    @State private var showingFinalScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var answerCount = 0

    var correctAnswer: Int {
        return 0
    }

    var body: some View {
        ZStack {
            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
                .ignoresSafeArea()

            VStack {
                VStack {
                    Spacer()
                    Text("Rock, Paper, Scissors")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                }

                VStack {
                    Spacer()
                    Text("App's move:")
                        .font(.body.bold())
                        .foregroundColor(.white)
                    Text(Self.movesEmoji[currentChoice])
                        .font(.system(size: 100))
                }

                VStack {
                    Spacer()
                    Text("Player should \(playerShouldWin ? "Win" : "Lose")!")
                        .font(.title.bold())
                        .foregroundColor(.white)
                }



                VStack {
                    Spacer()
                    Text("Tap the correct move:")
                        .font(.body.bold())
                        .foregroundColor(.white)
                    ForEach(0..<3) { number in
                        Button {
                            selectionTapped(number)
                        } label: {
                            Text(Self.movesEmoji[number])
                                .font(.system(size: 100))
                        }
                    }
                }

                VStack {
                    Spacer()
                    Text("Score: \(score)")
                        .font(.largeTitle)
                        .foregroundColor(.primary)
                }

                VStack {
                    Spacer()
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score).")
        }
        .alert(scoreTitle, isPresented: $showingFinalScore) {
            Button("Restart the Game", action: reset)
        } message: {
            Text("Your final score is \(score) out of \(Self.maxQuestions)")
        }
    }

    func selectionTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong!\nThe correct answer is \(Self.moves[correctAnswer])."
            score -= 1
        }

        answerCount += 1
        if answerCount == Self.maxQuestions {
            showingFinalScore = true
        } else {
            showingScore = true
        }
    }

    func askQuestion() {
        currentChoice = Int.random(in: 0...2)
        playerShouldWin.toggle()
    }

    func reset() {
        score = 0
        answerCount = 0

        askQuestion()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
