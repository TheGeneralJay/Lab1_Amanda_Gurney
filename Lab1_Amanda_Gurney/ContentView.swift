//
//  ContentView.swift
//  Lab1_Amanda_Gurney
//
//  Created by Amanda Gurney on 2025-02-09.
//

import SwiftUI

struct ContentView: View {
    
    @State
    private var primeNumbers = [
                                 2, 3, 5, 7, 11,
                                 13, 17, 19, 23, 29,
                                 31, 37, 41, 43, 47,
                                 53, 59, 61, 67, 71,
                                 73, 79, 83, 89, 97
    ]
    
    @State
    private var shownNumber: String?
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Text("Prime Number Game")
                    .font(.largeTitle)
            }
            .padding()
        }
        
        // Show button for starting the game.
        VStack {
            Button(action: {
                shownNumber = generateNumber()
            }, label: {
                Text("Start the Game")
            })
        }
        
        VStack {
            // Display the number to guess here.
            Text(shownNumber ?? "")
        }
    }
}

// Generate number to guess.
func generateNumber() -> String {
    return "\(Int.random(in: 1...100))"
}

#Preview {
    ContentView()
}
