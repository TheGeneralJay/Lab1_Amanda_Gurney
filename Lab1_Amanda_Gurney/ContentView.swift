//
//  ContentView.swift
//  Lab1_Amanda_Gurney
//
//  Created by Amanda Gurney on 2025-02-09.
//

import SwiftUI

struct ContentView: View {
    
    @State
    private var primeNumbers: [String] = [
                                 "2", "3", "5", "7", "11",
                                 "13", "17", "19", "23", "29",
                                 "31", "37", "41", "43", "47",
                                 "53", "59", "61", "67", "71",
                                 "73", "79", "83", "89", "97"
    ]
    
    @State
    private var shownNumber: String = generateNumber()
    @State
    private var attempts = 0
    @State
    private var numOfCorrect = 0
    @State
    private var correct: Bool = false
    // Alert variable.
    @State private var showGameOver = false
    

    
    var body: some View {
        VStack {
            // Display the number to guess here.
            Text(shownNumber)
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .padding(.bottom, 40.0)
        
        VStack {
            Button(action: {
                if (primeNumbers.contains(shownNumber)) {
                    correct = true
                    numOfCorrect += 1
                } else {
                    correct = false
                }
                
                attempts += 1
                
                shownNumber = nextNumber(attempts: attempts)
                
                // Check if game should end.
                if (shownNumber == "GAME OVER") {
                    showGameOver = true
                }
                
            }, label: {
                Text("PRIME")
            })
            .alert("Game Over!", isPresented: $showGameOver) {
                Button(action: {
                    shownNumber = generateNumber()
                    attempts = 0
                    numOfCorrect = 0
                    correct = false
                }, label: {
                    Text("OK")
                })
            } message: {
                Text("You got \(numOfCorrect)/10 answers correct!")
            }
        }
        .padding(.bottom, 40.0)
        
        VStack {
            Button(action: {
                if (primeNumbers.contains(shownNumber)) {
                    correct = false
                } else {
                    correct = true
                    numOfCorrect += 1
                }
                
                attempts += 1
                shownNumber = nextNumber(attempts: attempts)
                
                // Check if game should end.
                if (shownNumber == "GAME OVER") {
                    showGameOver = true
                }
            }, label: {
                Text("NOT PRIME")
            })
            .alert("Game Over!", isPresented: $showGameOver) {
                Button(action: {
                    shownNumber = generateNumber()
                    attempts = 0
                    numOfCorrect = 0
                    correct = false
                }, label: {
                    Text("OK")
                })
            } message: {
                Text("You got \(numOfCorrect)/10 answers correct!")
            }
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
