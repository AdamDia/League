//
//  HomeMatchesView.swift
//  League
//
//  Created by Adam Essam on 02/04/2023.
//

import SwiftUI

struct HomeMatchesView: View {
    
    @StateObject private var viewModel =  MatchesViewModel(networkManager: NetworkManager())
    
    var body: some View {
        NavigationView {
            List(viewModel.matches) { match in
                MatchCell(viewModel: viewModel, match: match)
            }
            .listRowSeparator(.hidden)
            .navigationTitle("League")
        }
        
        .onAppear {
            viewModel.getPLMatches()
        }
    }
}

struct HomeMatchesView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMatchesView()
    }
}

