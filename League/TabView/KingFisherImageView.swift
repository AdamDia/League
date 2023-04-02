//
//  KingFisherImageView.swift
//  League
//
//  Created by Adam Essam on 02/04/2023.
//

import SwiftUI
import Kingfisher

struct KingFisherImageView: View {
    let imageStrURL: String
    
    var body: some View {
        KFImage(URL(string: imageStrURL))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 30, height: 30)
    }
}

struct KingFisherImageView_Previews: PreviewProvider {
    static var previews: some View {
        KingFisherImageView(imageStrURL: "https://crests.football-data.org/PL.png")
    }
}
