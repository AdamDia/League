//
//  MatchCell.swift
//  League
//
//  Created by Adam Essam on 01/04/2023.
//

import SwiftUI

struct MatchCell: View {
    var match: Match
    
    var body: some View {
        VStack{
            HStack{
                Text(match.utcDate)
                Spacer()
                Button {
                    print("Fav")
                } label: {
                    Image(systemName: "heart")
                }
            }
            .padding(10.0)
            HStack {
                Spacer()
                Text(match.homeTeam.name)
                    .font(.system(size: 10.0))
                    .fontWeight(.bold)
                    .lineLimit(2)
                    
                KingFisherImageView(imageStrURL: match.homeTeam.clubIcon)
                
                if let homeScore = match.score.fullTime.home {
                    Text("\(homeScore) - \(match.score.fullTime.away!)")
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                } else {
                    Text(match.utcDate)
                }
               
                
                KingFisherImageView(imageStrURL: match.awayTeam.clubIcon)
                Text(match.awayTeam.name)
                    .font(.system(size: 10.0))
                    .fontWeight(.bold)
                    .lineLimit(2)
                Spacer()
            }
            
            
        }
        
    }
}

struct MatchCell_Previews: PreviewProvider {
    static var previews: some View {
        MatchCell(match: Match(id: 1, utcDate: "2023-04-01", homeTeam: Team(name: "LiverPool", clubIcon: "https://crests.football-data.org/PL.png"), awayTeam: Team(name: "Man City", clubIcon: "https://crests.football-data.org/PL.png"), score: Score(winner: "", fullTime: Time(home: 1, away: 1))))
    }
}
