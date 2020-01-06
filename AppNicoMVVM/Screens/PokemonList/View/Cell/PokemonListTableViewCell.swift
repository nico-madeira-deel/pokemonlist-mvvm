//
//  PokemonListTableViewCell.swift
//  AppNicoMVVM
//
//  Created by Gustavo Lembert da Cunha on 03/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import UIKit
import Kingfisher

class PokemonListTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    
    // MARK: - Properties
    var pokemon: Pokemon! {
        didSet {
            setupCell()
        }
    }
    
    var indexPokemon: Int! {
        didSet {
            if let unIndexPokemon = indexPokemon {
                let name = pokemon.name.capitalizingFirstLetter()
                pokemonName.text = "#\(unIndexPokemon) \(name)"
            }
        }
    }
    
    // MARK: - Functions
    func setupCell() {
        if let unImageUrl = pokemon.imageUrl,
            let unUrl = URL(string: unImageUrl) {
            let imageResource = ImageResource(downloadURL: unUrl)
            pokemonImage.kf.setImage(with: imageResource)
        }
    }
}
