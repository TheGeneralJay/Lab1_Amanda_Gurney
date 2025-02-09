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
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
