//
//  ApexPredator.swift
//  JPApexPredators17
//
//  Created by Justin Maronde on 3/19/24.
//

import Foundation
import SwiftUI

enum PredatorType: String, Decodable, CaseIterable, Identifiable {
    var id: PredatorType {
        self
    }
    
    case all
    case land
    case air
    case sea
    
    var background: Color {
        switch self {
        case .all:
                .blue
        case .land:
                .brown
        case .air:
                .teal
        case .sea:
                .blue
        }
    }
    
    var icon: String {
        switch self {
        case .all:
            "square.stack.3d.up.fill"
        case .land:
            "leaf.fill"
        case .air:
            "wind"
        case .sea:
            "drop.fill"
        }
    }
}

struct ApexPredator: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: PredatorType
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    struct MovieScene: Decodable, Identifiable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }
    
}
