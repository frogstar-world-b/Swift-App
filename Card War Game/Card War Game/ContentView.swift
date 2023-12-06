//
//  ContentView.swift
//
//  Created by Marian Farah on 11/04/23.
//

import SwiftUI

struct ContentView: View {
    // initialize some properties
    @State var playerCard = "card7"
    @State var computerCard = "card11"
    @State var playerScore = 0
    @State var computerScore = 0
    
    var body: some View {
        ZStack{
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Spacer()
                Image("logo")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(computerCard)
                    Spacer()
                }
                Spacer()
                Button(
                    action: {
                        deal()
                    },
                    label: {
                        Image("button")
                    })
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player").padding()
                        Text(String(playerScore)).font(.title)
                    }
                    Spacer()
                    VStack{
                        Text("Computer")
                            .padding()
                        Text(String(computerScore))
                            .font(.title)
                    }
                    Spacer()
                }.foregroundColor(.white)
                Spacer()
                Button(
                    action: {
                        clear_scores()
                    },
                    label: {
                    Text("Clear Scores")
                        .foregroundColor(Color.white.opacity(0.8))
                        .background(Color.blue.opacity(0.5))
                        .padding()
                        .cornerRadius(3.0)
                })
                Spacer()
            }.padding(10)
        }
    }
    
    func deal(){
        // randomly pick the player's card
        let playerValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerValue)
        // randomly pick the computer's card
        let computerValue = Int.random(in: 2...14)
        computerCard = "card" + String(computerValue)
        // update the scores accordingly
        if playerValue > computerValue{
            playerScore += 1
        }
        else if computerValue > playerValue{
            computerScore += 1
        }
        // a tie does not earn points
    }
    
    func clear_scores(){
        playerCard = "card7"
        computerCard = "card11"
        playerScore = 0
        computerScore = 0
    }
}

#Preview {
    ContentView()
}


