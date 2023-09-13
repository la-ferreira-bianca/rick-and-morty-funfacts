//
//  CharacterRow.swift
//  RickAndMortyFunFacts
//
//  Created by Bianca Ferreira on 01/08/23.
//

import SwiftUI

struct CharacterImage: View {
    var imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
    }
}

struct CharacterRow: View {
    @Binding var name: String
    @Binding var iconURL: String
    @Binding var status: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                AsyncImage(url: URL(string: iconURL))
                    .scaledToFit()
                
                Text(name)
                    .padding(.top, 10)
                    .font(.title)
                    .foregroundColor(.white)
                
                VStack {
                    Label("Vivo(a)", systemImage: "waveform.path.ecg")
                        .font(.title2)
                    
                    Label("Vivo(a)", systemImage: "waveform.path.ecg")
                        .font(.title2)
                    
                    Label("Vivo(a)", systemImage: "waveform.path.ecg")
                        .font(.title2)
                }
            }.overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color("medium-green"), lineWidth: 4)
            )
        }
        .scaledToFit()
        .padding(.all)
        
        
        //        ZStack(alignment: .bottom) {
        //
        //            Text(name)
        //                .font(.title3)
        //                .foregroundColor(.white)
        //                .shadow(color: .black, radius: 1, x: 3, y: 2)
        //        }
        //
        //        .frame(width: 140, height: 140)
        //        .padding(.all)
        //        .background(
        //            AsyncImage(url: URL(string: iconURL))
        //                .blur(radius: 2)
        //        )
        //        .cornerRadius(9)
        //        .overlay(RoundedRectangle(cornerRadius: 9)
        //            .stroke(Color.white, lineWidth: 1)
        //            .shadow(color: .black, radius: 3, x: 2, y: 2))
    }
}

struct CharacterRow_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRow(
            name: .constant("Annie"),
            iconURL: .constant("https://rickandmortyapi.com/api/character/avatar/17.jpeg"),
            status: .constant("Vivo(a)")
        ).preferredColorScheme(.dark)
    }
}
