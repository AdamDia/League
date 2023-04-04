//
//  MatchCell.swift
//  League
//
//  Created by Adam Essam on 01/04/2023.
//

import SwiftUI

struct MatchCell: View {
    @ObservedObject var viewModel: MatchesViewModel
    var match: Match
    
    var body: some View {
        VStack(alignment: .center){
            HStack{
                Spacer()
                Button(action: { viewModel.toggleFavorite(match: match) }) {
                    withAnimation {
                        Image(systemName: viewModel.favoriteMatches.contains(match) ? "heart.fill" : "heart")
                            .frame(width: 30)
                    }
                }
            }
            .padding(5.0)
            
            HStack(spacing: 8.0) {
                Spacer()
                HStack(spacing: 10.0){
                    Text(match.homeTeam.name)
                        .font(.system(size: 10.0))
                        .fontWeight(.bold)
                        .lineLimit(2)
                    
                    KingFisherImageView(imageStrURL: match.homeTeam.clubIcon)
                }
                
                
                if let homeScore = match.score.fullTime.home {
                    Text("\(homeScore) - \(match.score.fullTime.away!)")
                        .frame(maxWidth: .infinity)
                    
                } else {
                    Text(DateFormatter.hourMinuteFormatter.convertDateString(match.utcDate) ?? "Postponded")
                        .font(.system(size: 10.0))
                        .fontWeight(.bold)
                    
                }
                
                
                
                HStack(spacing: 10.0){
                    KingFisherImageView(imageStrURL: match.awayTeam.clubIcon)
                    Text(match.awayTeam.name)
                        .font(.system(size: 10.0))
                        .fontWeight(.bold)
                        .lineLimit(2)
                }
                Spacer()
            }
            .padding(.bottom, 5.0)
            
        }
        
    }
}

struct MatchCell_Previews: PreviewProvider {
    static var previews: some View {
        MatchCell(viewModel: MatchesViewModel(networkManager: NetworkManager()), match: Match(id: 1, utcDate: "2023-04-01", homeTeam: Team(name: "LiverPool", clubIcon: "https://crests.football-data.org/PL.png"), awayTeam: Team(name: "Man City", clubIcon: "https://crests.football-data.org/PL.png"), score: Score(fullTime: Time(home: 1, away: 1))))
    }
}
