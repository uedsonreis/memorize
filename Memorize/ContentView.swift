//
//  ContentView.swift
//  Memorize
//
//  Created by Uedson Reis on 09/07/20.
//  Copyright © 2020 FGN. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ForEach(0..<4) { line in
                LineOfCard(numberOfCols: 4)
            }
        }
        .foregroundColor(Color.orange)
        .font(Font.largeTitle)
        .padding()
    }
}

struct LineOfCard: View {
    var numberOfCols: Int
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfCols) { col in
                Card(isFaceUp: true)
            }
        }
    }
}

struct Card: View {
    var isFaceUp: Bool
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text("👻")
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return ContentView()
    }
}
