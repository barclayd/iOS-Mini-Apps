//
//  ContentView.swift
//  Rocket-Launch
//
//  Created by Daniel Barclay on 01/01/2020.
//  Copyright © 2020 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")

    let missions: [Mission] = Bundle.main.decode("missions.json")

    var body: some View {
        NavigationView {
            List(missions) {
                mission in
                NavigationLink(destination: Text("DetailView")) {
                    Image(mission.image).resizable().scaledToFit().frame(width: 44, height: 44)
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(mission.displayDate)
                            .font(.subheadline)
                    }
                }
            }
            .navigationBarTitle("Rocket Launches")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
