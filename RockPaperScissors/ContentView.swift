//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Katrina on 2024-11-06.
//

import SwiftUI

struct ContentView: View {
    
    @State var selection = "question"
    @State var computerSelection = "question"
    @State var myScore = 0
    @State var compScore = 0
    @State var ready = 0
    @State var fighter = "Choose your fighter:"
    var body: some View {
        
        
        ZStack{
            Color(red: 205/255.0, green: 181/255.0, blue: 255/255.0)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Rock Paper Scissors!")
                    .font(.custom("Starborn", size: 44.0))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 107/255.0, green: 102/255.0, blue: 198/255.0))
                Spacer()
                HStack {
                    Image(selection)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    Spacer()
                    Image(computerSelection)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                }
                Spacer()
                ZStack{
                    Button(action: {
                                fight()
                                ready = 0
                            }) {
                                Text("FIGHT!")
                                    .padding()
                                    .font(.custom("Starborn", size: 24))
                                    .background(Color(red: 194/255.0, green: 163/255.0, blue: 253/255.0))
                                    .foregroundColor(Color(red: 107/255.0, green: 102/255.0, blue: 198/255.0))
                                    .cornerRadius(30)

                            }
                            .padding()

                }

                Spacer()
                Text(fighter)
                    .font(.custom("Starborn", size: 12))
                    .foregroundColor(Color(red: 107/255.0, green: 102/255.0, blue: 198/255.0))
                Spacer()
                HStack{
                    Button {
                        selection = "rock"
                        ready = 1
                        computerSelection = "question"
                        fighter = "Choose your fighter:"
                    } label: {
                        Image("rock")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                    }
                    Button {
                        selection = "paper"
                        ready = 1
                        computerSelection = "question"
                        fighter = "Choose your fighter:"
                    } label: {
                        Image("paper")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                    }
                    Button {
                        selection = "scissors"
                        ready = 1
                        computerSelection = "question"
                        fighter = "Choose your fighter:"
                    } label: {
                        Image("scissors")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                    }
                }
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("PlAyer")
                            .padding(.bottom)
                        Text(String(myScore))
                    }
                    Spacer()
                    VStack {
                        Text("Computer")
                            .padding(.bottom)
                        Text(String(compScore))
                    }
                    Spacer()
                }
                .font(.custom("Starborn", size: 18))
                .foregroundColor(Color(red: 107/255.0, green: 102/255.0, blue: 198/255.0))

                Spacer()
            }
            .padding()
        }
        
    }
    
    func fight() {
        if (ready == 1) {
            let choices = ["rock", "paper", "scissors"]
            computerSelection = choices.randomElement() ?? "rock"
            if (selection == "rock") {
                if (computerSelection == "rock") {
                    fighter = "TIE!"
                } else if (computerSelection == "paper") {
                    compScore += 1
                    fighter = "COMPUTER WINS!"
                    selection = "rockLose"
                    computerSelection = "transparent"
                } else {
                    myScore += 1
                    fighter = "YOU WIN!"
                    computerSelection = "scissorsLose"
                }
            } else if (selection == "paper") {
                if (computerSelection == "rock") {
                    myScore += 1
                    fighter = "YOU WIN!"
                    computerSelection = "rockLose"
                    selection = "transparent"
                } else if (computerSelection == "paper") {
                    fighter = "TIE!"
                } else {
                    compScore += 1
                    fighter = "COMPUTER WINS!"
                    selection = "paperLose"
                }
            } else {
                if (computerSelection == "rock") {
                    compScore += 1
                    selection = "scissorsLose"
                    fighter = "COMPUTER WINS!"
                } else if (computerSelection == "paper") {
                    myScore += 1
                    fighter = "YOU WIN!"
                    computerSelection = "paperLose"
                } else {
                    fighter = "TIE!"
                }
            }
        }
        else {
            fighter = "Please choose your fighter to continue:"
        }
                        
    }
}



#Preview {
    ContentView()
}

