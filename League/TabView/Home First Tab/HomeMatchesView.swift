//
//  HomeMatchesView.swift
//  League
//
//  Created by Adam Essam on 02/04/2023.
//

import SwiftUI

struct HomeMatchesView: View {
    
    @EnvironmentObject var viewModel: MatchesViewModel
    
    var body: some View {
        ZStack {
            NavigationView {
                        ScrollView {
                            LazyVStack(alignment: .leading) {
                                ForEach(viewModel.sortedDates, id: \.self) { date in
                                    Group {
                                        Section(header: Text(date, style: .date)) {
                                            ForEach(viewModel.matchesByDate[date] ?? []) { match in
                                                MatchCell(viewModel: viewModel, match: match)
                                                    .background(Color(hex: "D3D3D3"))
                                                    .cornerRadius(10.0)
                                                    .padding(.bottom)
                                                    
                                            }
                                        }
                                        .font(.headline)
                                    }
                                    .padding(.bottom, -5.0)
                                }
                            }
                            
                        }
                        .onAppear {
                            viewModel.getPLMatches()
                        }
                    .navigationTitle("League")
            }
            if viewModel.isLoading {LoadingView()}
        }
    }
    
    struct HomeMatchesView_Previews: PreviewProvider {
        static var previews: some View {
            HomeMatchesView()
        }
    }
}
