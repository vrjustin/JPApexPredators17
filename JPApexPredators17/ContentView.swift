//
//  ContentView.swift
//  JPApexPredators17
//
//  Created by Justin Maronde on 3/19/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var searchText = ""
    @State var alphabetical = false
    @State var currentMenuTypeSelection = PredatorType.all
    
    let predators = Predators()
    
    var filteredDinos: [ApexPredator] {
        predators.filter(by: currentMenuTypeSelection)
        predators.sort(by: alphabetical)
        return predators.search(for: searchText)
    }
    
    var body: some View {
        NavigationStack {
            List(filteredDinos) { predator in
                NavigationLink {
                    PredatorDetailsView(predator: predator, predatorPosition: .camera(MapCamera(centerCoordinate: predator.location, distance: 30000)))
                } label: {
                    HStack {
                        //Image
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .shadow(color: .white, radius: 1)
                        
                        VStack(alignment: .leading) {
                            //name
                            Text(predator.name)
                                .fontWeight(.bold)
                            
                            //type
                            Text(predator.type.rawValue.capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 13)
                                .padding(.vertical, 5)
                                .background(predator.type.background)
                                .clipShape(.capsule)
                            
                        }
                    }
                    
                }
            }
            .navigationTitle("Apex Predators")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.default, value: searchText)
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    Button {
                        withAnimation {
                            alphabetical.toggle()
                        }
                    } label: {
                        Image(systemName: alphabetical ? "film" : "textformat")
                            .symbolEffect(.bounce, value: alphabetical)
                    }
                })
                ToolbarItem(placement: .topBarTrailing, content: {
                    Menu {
                        Picker("Filter", selection: $currentMenuTypeSelection.animation()) {
                            ForEach(PredatorType.allCases) { type in
                                Label(type.rawValue.capitalized, systemImage: type.icon)
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                })
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
