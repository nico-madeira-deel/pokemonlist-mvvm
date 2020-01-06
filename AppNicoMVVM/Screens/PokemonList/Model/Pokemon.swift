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
    var imageUrlGif: String?
    let height: Int?
    let weight: Int?
    let id: Int?
    let types: [Type]?
    
    // MARK: - Initializer
    init(name: String) {
        self.name = name
        self.imageUrl = "https://play.pokemonshowdown.com/sprites/gen5/\(name).png"
        self.imageUrlGif = "https://play.pokemonshowdown.com/sprites/ani/\(name).gif"
        self.height = nil
        self.weight = nil
        self.id = nil
        self.types = nil
    }
}
