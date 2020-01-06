//
//  Pokemon.swift
//  AppNicoMVVM
//
//  Created by Gustavo Lembert da Cunha on 03/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import Foundation

class Pokemon: Decodable {
    
    // MARK: - Properties
    let name: String
    var imageUrl: String?
    let height: Int?
    let weight: Int?
    let id: Int?
    
    // MARK: - Initializer
    init(name: String) {
        self.name = name
        self.imageUrl = "https://play.pokemonshowdown.com/sprites/gen5/\(name).png"
        self.height = nil
        self.weight = nil
        self.id = nil
    }
}
