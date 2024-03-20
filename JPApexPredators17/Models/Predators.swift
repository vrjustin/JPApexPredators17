//
//  Predators.swift
//  JPApexPredators17
//
//  Created by Justin Maronde on 3/19/24.
//

import Foundation

class Predators {
    var apexPredators: [ApexPredator] = []
    
    init() {
        decodeApexPredatorsData()
    }
    
    func decodeApexPredatorsData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                apexPredators = try decoder.decode([ApexPredator].self, from: data)
            } catch {
                print("Error decoding json data: \(error)")
            }
        }
    }
    
    func search(for searchText: String) -> [ApexPredator] {
        if searchText.isEmpty {
            return apexPredators
        } else {
            return apexPredators.filter { predator in
                predator.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}
