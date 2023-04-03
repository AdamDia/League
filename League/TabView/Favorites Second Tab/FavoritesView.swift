//
//  FavoritesView.swift
//  League
//
//  Created by Adam Essam on 02/04/2023.
//

import SwiftUI

struct FavoritesView: View {
    
    @StateObject private var viewModel =  MatchesViewModel(networkManager: NetworkManager())
    
    var body: some View {
        if viewModel.favoriteMatches.isEmpty {
            Text("You don't have any favorite matches yet.")
        } else {
            List(viewModel.favoriteMatches) { match in
                MatchCell(viewModel: viewModel, match: match)
            }
        }
        
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
       FavoritesView()
    }
}
