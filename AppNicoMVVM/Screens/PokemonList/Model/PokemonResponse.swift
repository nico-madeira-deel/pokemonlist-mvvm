//
//  PokemonResponse.swift
//  AppNicoMVVM
//
//  Created by Gustavo Lembert da Cunha on 03/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import Foundation

struct PokemonResponse: Decodable {
    
    // MARK: - Properties
    let results: [Pokemon]
}
