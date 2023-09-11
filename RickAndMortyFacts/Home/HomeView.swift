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
        NavigationStack {
            VStack {
                Image("home-logo")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                print("teste")
                            } label: {
                                Image(systemName: "house")
                            }
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                print("teste")
                            } label: {
                                Image(systemName: "star")
                            }
                        }
                    }
                
                TabView(selection: $selectedPage) {
                    //TODO: fix response and wrong selected page
                    ForEach(1..<7) { item in
                        CarrosellView(page: item)
                        //                            .tag(item)
                    }
                }
                .tabViewStyle(.page)
            }
            .background(Color.black)
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
