//
//  HomeView.swift
//  RickAndMortyFunFacts
//
//  Created by Bianca Ferreira on 01/08/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var observed = Observed()
    @State var selectedPage = 0
    
    let addaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Rick And Morty Fucking Fun Facts")
                    .font(.title2)
                    .padding(.top)
                
                TabView(selection: $selectedPage) {
                    //TODO: fix response and wrong selected page
                    ForEach(0..<3) { item in
                        CarrosellView(page: item)
//                            .tag(item)
                    }
                }
                .tabViewStyle(.page)
            }
            
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
