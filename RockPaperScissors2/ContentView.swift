//
//  ContentView.swift
//  RockPaperScissors2
//
//  Created by Waihon Yew on 04/05/2022.
//

import SwiftUI

struct ContentView: View {
    static let moves = ["Rock", "Paper", "Scissors"]
    @State var currentChoice = Self.moves[Int.random(in: 0...2)]
    @State var playerShouldWin = Bool.random()

    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
