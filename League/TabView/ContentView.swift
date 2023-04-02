//
//  ContentView.swift
//  League
//
//  Created by Adam Essam on 30/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeMatchesView()
                .tabItem {
                    Label("Matches", systemImage: "soccerball")
                }
            
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
          }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

