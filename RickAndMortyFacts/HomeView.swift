//
//  ContentView.swift
//  RickAndMortyFacts
//
//  Created by Bianca Ferreira on 25/07/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var caractersViewModel = CarectersViewModel()
    var body: some View {
        List {
            ForEach(caractersViewModel.results) { result in
                HStack {
                    AsyncImage(url: caractersViewModel.getImage(result.image)) { phase in
                        switch phase {
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 30, maxHeight: 30)
                        default:
                            Image(systemName: "photo")
                        }
                    }
                    Text(result.name)
                }
                .scaledToFit()
            }
        }
        .padding()
        .onAppear {
            caractersViewModel.fetch()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

