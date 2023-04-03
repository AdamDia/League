//
//  ContentView.swift
//  League
//
//  Created by Adam Essam on 30/03/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = MatchesViewModel(networkManager: NetworkManager())
    var body: some View {
        TabView {
            HomeMatchesView()
                .tabItem {
                    Label("Matches", systemImage: "soccerball")
                }
                .tag(0)
                .environmentObject(viewModel)
            
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
                .tag(1)
                .environmentObject(viewModel)
          }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

