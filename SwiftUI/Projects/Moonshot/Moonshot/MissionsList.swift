//
//  MissionsList.swift
//  Moonshot
//
//  Created by Jonathan Copeland on 08/04/2023.
//

import SwiftUI

struct MissionsList: View {
    
    let astronauts: [String: Astronaut]
    let missions: [Mission]


    var body: some View {
        List(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .padding()
                                .accessibilityHidden(true)

                            VStack (alignment: .leading) {
                                Text(mission.displayName)
                                    .font(.headline)
                                Text(mission.formattedLaunchDate)
                            }

                        }
            }
            .preferredColorScheme(.dark)
            .listRowBackground(Color.darkBackground)

        }
        .listStyle(.plain)
    }
}


struct MissionsList_Previews: PreviewProvider {
    static var previews: some View {
        MissionsList(astronauts: Bundle.main.decode("astronauts.json"), missions: Bundle.main.decode("missions.json"))
            .preferredColorScheme(.dark)
    }
}

