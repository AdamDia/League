//
//  FavoritesView.swift
//  League
//
//  Created by Adam Essam on 02/04/2023.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var viewModel:  MatchesViewModel
    
    var body: some View {
        ZStack{
            if viewModel.favoriteMatches.isEmpty {
                Text("You don't have any favorite matches yet.")
            } else {
                List(Array(viewModel.favoriteMatches)) { match in
                    MatchCell(viewModel: viewModel, match: match)
                }
            }
        }
        .onAppear {
            viewModel.loadFavorites()
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
