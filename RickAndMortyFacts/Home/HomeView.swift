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
                
                HStack {
                    Button {
                        print("personagem")
                    } label: {
                        Label("Pesonagem", systemImage: "person.circle.fill")
                            .fixedSize()
                    }
                    .padding()
                    .background(Color("aqua-green"))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    
                    Button {
                        print("episodios")
                    } label: {
                        Label("Episodios", systemImage: "play.tv")
                            .fixedSize()
                    }
                    .padding()
                    .background(Color("aqua-green"))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    
                    Button {
                        print("localização")
                    } label: {
                        Label("Localização", systemImage: "network")
                            .fixedSize()
                    }
                    .padding()
                    .background(Color("aqua-green"))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 29)
                
                Button {
                    print("Favoritos")
                } label: {
                    Label("Favoritos", systemImage: "heart.fill")
                        .fixedSize()
                }
                .padding()
                .background(Color("dark-green"))
                .foregroundColor(.white)
                .clipShape(Capsule())
                
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
