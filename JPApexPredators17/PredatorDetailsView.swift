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
                
                // Name
                
                // Current Location
                
                // Movies appears in
                
                // Movie Moments
                
                // link to webpage
                
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    PredatorDetailsView(predator: Predators().apexPredators[0])
//        .preferredColorScheme(.dark)
}
