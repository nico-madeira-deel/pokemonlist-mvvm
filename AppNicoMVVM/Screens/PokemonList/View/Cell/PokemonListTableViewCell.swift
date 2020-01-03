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
    
    // MARK: - Functions
    func setupCell() {
        pokemonName.text = pokemon.name
        
        if let unImageUrl = pokemon.imageUrl,
            let unUrl = URL(string: unImageUrl) {
            let imageResource = ImageResource(downloadURL: unUrl)
            pokemonImage.kf.setImage(with: imageResource)
        }
    }
}
