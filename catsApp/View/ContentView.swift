//
//  ContentView.swift
//  catsApp
//
//  Created by Harold Villacob on 18/05/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewViewModel()
    var body: some View {
        VStack {
            headerView
            listOfCats
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
    
    var headerView: some View {
        Text("Catbreeds")
            .font(.title3)
            .fontWeight(.bold)
            .padding()
    }
    
    var listOfCats: some View {
        List(viewModel.catBreeds, id: \.id) { breed in
            VStack(alignment: .leading) {
                Text(breed.name)
                    .font(.headline)
                if let imageURL = URL(string: "https://cdn2.thecatapi.com/images/\(breed.reference_image_id ?? "").jpg") {
                    AsyncImage(url: imageURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(2)
                            .frame(maxWidth: .infinity)
                    }
                }
                
                HStack {
                    Text("Origin: ")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    +
                    Text("\(breed.origin)")
                        .font(.subheadline)
                    Spacer()
                    Text("Intelligence: ")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    +
                    Text("\(breed.intelligence)")
                        .font(.subheadline)
                }
                Text("Affection Level: ")
                    .font(.subheadline)
                    .fontWeight(.bold)
                +
                Text("\(breed.affection_level)")
                    .font(.subheadline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
