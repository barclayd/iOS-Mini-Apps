//
//  ContentView.swift
//  Guess The Flag
//
//  Created by Daniel Barclay on 30/12/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    var correctAnswer = Int.random(in: 0...2)
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().barTintColor = UIColor(red: 0.33, green: 0.29, blue: 0.49, alpha: 1)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(red: 0.33, green: 0.29, blue: 0.49), Color(red: 1, green: 0.83, blue: 0.32)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.bottom)
                VStack(spacing: 30) {
                    VStack {
                        Text("Tap the flag of").foregroundColor(.white).padding(25)
                        Text(countries[correctAnswer]).foregroundColor(.green).bold().font(.system(size: 48))
                    }
                    Spacer()
                    ForEach(0..<3) {
                        number in Button(action: {
                            // flag was tapped
                        }) {
                            Image(self.countries[number]).renderingMode(.original)
                        }
                    }
                    Spacer()
                }
            }
            .navigationBarTitle("Guess The Flag", displayMode: .inline)
        }
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
