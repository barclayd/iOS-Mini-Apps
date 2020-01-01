//
//  MissionDetail.swift
//  Rocket-Launch
//
//  Created by Daniel Barclay on 01/01/2020.
//  Copyright © 2020 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }

    let mission: Mission
    var astronauts: [CrewMember]

    var body: some View {
        GeometryReader {
            geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.7)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        .padding(.top)

                    Text(self.mission.description).padding()

                    ForEach(self.astronauts, id: \.role) {
                        crewMember in
                        HStack {
                            Image(crewMember.astronaut.id).resizable()
                                .frame(width: 83, height: 60)
                                .clipShape(Ellipse())
                                .overlay(Ellipse().stroke(Color.primary, lineWidth: 1))

                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                                    .font(.subheadline)
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                    }

                    Spacer(minLength: 25)
                }
            }
        }
        .navigationBarTitle(Text(mission.displayName), displayMode: .inline)
    }

    init(mission: Mission, astronauts: [Astronaut]) {
        self.mission = mission

        var matches = [CrewMember]()

        for member in mission.crew {
            if let match = astronauts.first(where: {
                $0.id == member.name
            }) {
                matches.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("Missing member")
            }
        }
        self.astronauts = matches
    }
}

struct MissionDetail_Previews: PreviewProvider {
    static let missions: [Mission] =
        Bundle.main.decode("missions.json")

    static let astronauts: [Astronaut] =
        Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
    }
}
