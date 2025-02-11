//
//  ContentView.swift
//  Lab1_Amanda_Gurney
//
//  Created by Amanda Gurney on 2025-02-09.
//

import SwiftUI

struct ContentView: View {
    
    // Prime numbers used in the game (between 1-100).
    @State
    private var primeNumbers: [String] = [
                                 "2", "3", "5", "7", "11",
                                 "13", "17", "19", "23", "29",
                                 "31", "37", "41", "43", "47",
                                 "53", "59", "61", "67", "71",
                                 "73", "79", "83", "89", "97"
    ]
    
    // Number displayed on the screen.
    @State
    private var shownNumber: String = generateNumber()
    // Attempts counter.
    @State
    private var attempts = 0
    // Correct answers counter.
    @State
    private var numOfCorrect = 0
    // Correct boolean.
    @State
    private var correct: Bool = false
    // Show game over alert variable.
    @State
    private var showGameOver = false
    // Timer variables.
    @State private var timerCounter = 5
    @State private var timerOn = true
    
    // Initialize timer.
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        // Display timer up top for easy viewing.
        VStack {
            Text("\(timerCounter)")
                .onReceive(timer) {_ in
                    if timerCounter > 0 && timerOn {
                        timerCounter -= 1
                    } else {
                        timerOn = false
                    }
                }
                .font(.system(size: 50, weight: .bold))
                .foregroundStyle(.red)
        }
        .padding(.bottom, 40.0)
        
        VStack {
            // Display the number to guess here.
            Text(shownNumber)
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .padding(.bottom, 40.0)
        
        ZStack {
            VStack {
                Button(action: {
                    // If shown number is in the predetermined primeNumbers array, answer is correct.
                    if (primeNumbers.contains(shownNumber)) {
                        correct = true
                        numOfCorrect += 1
                    } else {
                        correct = false
                    }
                    // Reset timer if an answer is selected.
                    timerCounter = 5
                    
                    // Increase attempts and change shown number.
                    attempts += 1
                    shownNumber = nextNumber(attempts: attempts)
                    
                    // Check if game should end.
                    if (shownNumber == "GAME OVER") {
                        timerOn = false
                        showGameOver = true
                    }
                    
                }, label: {
                    Text("PRIME")
                })
                .padding(.bottom, 40.0)
            }
            .padding(.bottom, 40.0)
            
            VStack {
                Button(action: {
                    // If shown number is not prime, answer is correct.
                    if (primeNumbers.contains(shownNumber)) {
                        correct = false
                    } else {
                        correct = true
                        numOfCorrect += 1
                    }
                    // Reset timer if an answer is selected.
                    timerCounter = 5
                    
                    // Increase the attempts counter and generate a new number to guess.
                    attempts += 1
                    shownNumber = nextNumber(attempts: attempts)
                    
                    // Check if game should end.
                    if (shownNumber == "GAME OVER") {
                        timerOn = false
                        showGameOver = true
                    }
                }, label: {
                    Text("NOT PRIME")
                })
            }
        }
        // If timer hits 0, count the attempt as incorrect.
        .onReceive(timer) {_ in
            if timerCounter == 0 {
                timerCounter = 5
                correct = false
                attempts += 1
                shownNumber = nextNumber(attempts: attempts)
                
                // Check if game should end.
                if (shownNumber == "GAME OVER") {
                    timerOn = false
                    showGameOver = true
                }
            }
        }
        // Run alert if game is over, reset all values.
        .alert("Game Over!", isPresented: $showGameOver) {
            Button(action: {
                shownNumber = generateNumber()
                attempts = 0
                numOfCorrect = 0
                correct = false
                timerOn = true
            }, label: {
                Text("OK")
            })
        } message: {
            Text("You got \(numOfCorrect)/10 answers correct!")
        }
        .padding(.bottom, 40.0)
        
        
        // Correct / incorrect answers.
        VStack {
            if (attempts != 0) {
                Text("\(correct)")
            }
        }
    }
}

// Generate number to guess.
func generateNumber() -> String {
    return "\(Int.random(in: 1...100))"
}

// Generate new number.
func nextNumber(attempts: Int) -> String {
    if (attempts <= 10) {
        return generateNumber()
    } else {
        // Dummy value that we can test for to ensure game doesn't continue.
        return "GAME OVER"
    }
}

#Preview {
    ContentView()
}
