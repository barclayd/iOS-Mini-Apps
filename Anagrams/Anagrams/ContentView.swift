//
//  ContentView.swift
//  Anagrams
//
//  Created by Daniel Barclay on 30/12/2019.
//  Copyright © 2019 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Text("Look at me, I'm static!").font(.headline)
            Section(header: Text("Section 1")) {
                ForEach(0..<5) {
                    Text("Hello there, \($0)")
                }
            }
            Section(header: Text("Section 2")) {
                Text("Look at me, I'm static also!")
            }
        }
        .listStyle(GroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
