//
//  FavoritesView.swift
//  League
//
//  Created by Adam Essam on 02/04/2023.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
            List  {
                ForEach (1...5, id: \.self) {_ in
                    Text("Favorite")
                }
            }
        }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
