//
//  ContentView.swift
//  War card game
//
//  Created by Tamez, Elan - Student on 10/10/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerChoice = 1   // 1=rock, 2=paper, 3=scissors
    @State private var cpuChoice = 1
    @State private var playerScore = 0
    @State private var cpuScore = 0
    @State private var result = ""
    
    var body: some View {
        ZStack {
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Image("pap")
                Spacer()
                
                // Player and CPU choices
                HStack {
                    Spacer()
                    Image(choiceName(playerChoice))
                        .resizable()
                        .scaledToFit()
                    Spacer()
                    Image(choiceName(cpuChoice))
                        .resizable()
                        .scaledToFit()
                    Spacer()
                }
                .frame(height: 120)
                Spacer()
                Text(result)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.black)
                    .padding(.top, 10)
                
                Spacer()
                
                // Player buttons
                HStack(spacing: 20) {
                    ForEach(1...3, id: \.self) { choice in
                        Button {
                            play(choice)
                        } label: {
                            Image(choiceName(choice))
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }
                .frame(height: 100)
                
                Spacer()
                
                // Scoreboard
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                        Text("\(playerScore)")
                    }
                    .font(.title)
                    .bold()
                    Spacer()
                    VStack {
                        Text("CPU")
                        Text("\(cpuScore)")
                    }
                    .font(.title)
                    .bold()
                    Spacer()
                }
                Spacer()
            }
            .padding()
            .foregroundStyle(.black)
        }
    }
    
    // Returns image name for a choice
    func choiceName(_ num: Int) -> String {
        ["rock1", "papers1", "scissors2"][num - 1]
    }
    
    
    func play(_ choice: Int) {
        playerChoice = choice
        cpuChoice = Int.random(in: 1...3)
        
        if playerChoice == cpuChoice {
            result = "It's a Tie!"
        } else if (playerChoice == 1 && cpuChoice == 3) ||
                    (playerChoice == 2 && cpuChoice == 1) ||
                    (playerChoice == 3 && cpuChoice == 2) {
            result = "You Win!"
            playerScore += 1
        } else {
            result = "CPU Wins!"
            cpuScore += 1
        }
    }
}

#Preview {
    ContentView()
}
