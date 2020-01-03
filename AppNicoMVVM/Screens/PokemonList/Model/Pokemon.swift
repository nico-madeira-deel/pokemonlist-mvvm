//
//  Pokemon.swift
//  AppNicoMVVM
//
//  Created by Gustavo Lembert da Cunha on 03/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import Foundation

struct Pokemon: Decodable {
    
    // MARK: - Properties
    let name: String
    let imageUrl: String?
    
    // MARK: - Initializer
    init(name: String) {
        self.name = name
        self.imageUrl = "https://play.pokemonshowdown.com/sprites/gen5/\(name).png"
    }
}
