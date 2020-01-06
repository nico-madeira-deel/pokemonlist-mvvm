//
//  PokemonType.swift
//  AppNicoMVVM
//
//  Created by Gustavo Lembert da Cunha on 06/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import UIKit

struct TypeName: Decodable {
    let name: String?
}

class Type: Decodable {
    let type: TypeName?
    let typeColors: [String:String]?
    
    static func getColorByType(type: String) -> UIColor? {
        let pokemonTypes = ["normal", "fighting", "flying", "poison", "ground", "rock", "bug", "ghost", "steel", "fire", "water", "grass", "electric", "psychic", "ice", "dragon", "dark", "fairy"]
        let pokemonColors = ["#c8cde4", "#e0c7a0", "#b0a0e0", "#e0d5a0", "#daaa88", "", "#d4c876", "#cccccc", "#7c84bf", "#e4ad67", "#87b4da", "#8cd088", "#dec85c","#9e8ace", "#9e8aca", "#9fbed0", "#949AA8", "#c89fd2"]
        for (index, pokemon) in pokemonTypes.enumerated() {
            if pokemon == type {
                let color = pokemonColors[index]
                return UIColor(hex: "\(color)ff")
            }
        }
        
        return UIColor.blue
    }
}
