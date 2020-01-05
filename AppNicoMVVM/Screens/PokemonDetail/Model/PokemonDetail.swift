//
//  PokemonDetail.swift
//  AppNicoMVVM
//
//  Created by Tag Livros on 04/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import Foundation

struct PokemonDetail: Decodable {
    
    // MARK: - Properties
    let name: String?
    let imageUrl: String?
    let height: Int?
    let weight: Int?
    let sprites: [String:String]?
    let id: Int?
    let location_area_encounters: String?
    let forms: [String:String]?
    let moves: [String:String]?
    let base_experience: Int?
    let stats: [String:String]?
    let species: [String:String]?
    let game_indices: [String:String]?
    let held_items: [String:String]?
    let order: Int?
    let abilities: [String:String]?
    let is_default: Bool?
    let types: [String:String]?
}
