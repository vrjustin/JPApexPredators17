//
//  PredatorDetailsView.swift
//  JPApexPredators17
//
//  Created by Justin Maronde on 3/20/24.
//

import SwiftUI

struct PredatorDetailsView: View {
    let predator: ApexPredator
    var body: some View {
        GeometryReader { geoReader in
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    //Background Image
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                    
                    //Dino Image
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geoReader.size.width / 1.5, height: geoReader.size.height / 3)
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 7)
                        .offset(y: 20)
                }
                
                VStack(alignment: .leading) {
                    // Name
                    Text(predator.name)
                        .font(.largeTitle)
                    
                    // Current Location
                    
                    // Movies appears in
                    Text("Appears In:")
                        .font(.title3)
                    ForEach(predator.movies, id: \.self) { movie in
                        Text("•" + movie)
                            .font(.subheadline)
                    }
                    
                    // Movie Moments
                    Text("Movie Moments")
                        .font(.title)
                        .padding(.top, 15)
                    ForEach(predator.movieScenes) { scene in
                        Text(scene.movie)
                            .font(.title2)
                            .padding(.vertical, 1)
                        
                        Text(scene.sceneDescription)
                            .padding(.bottom, 15)
                    }
                    
                    // link to webpage
                    Text("Read More:")
                        .font(.caption)
                    Link(predator.link, destination: URL(string: predator.link)!)
                        .font(.caption)
                        .foregroundStyle(.blue)
                }
                .padding()
                .padding(.bottom)
                .frame(width: geoReader.size.width, alignment: .leading)
                
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    PredatorDetailsView(predator: Predators().apexPredators[10])
//        .preferredColorScheme(.dark)
}
