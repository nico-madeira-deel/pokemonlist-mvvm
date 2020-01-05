//
//  PokemonDetailViewController.swift
//  AppNicoMVVM
//
//  Created by Gustavo Lembert da Cunha on 03/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    // MARK - Outlets
    @IBOutlet weak var pokemonName: UILabel!
    
    // MARK: - Properties
    var pokemon: Pokemon!
    private var viewModel: PokemonDetailViewModel!
    private var networking = PokemonDetailNetworking()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonName.text = pokemon.name
        setupBind()
        setupFetch()
        print(viewModel.pokemonDetail)
    }
    
    private func setupBind() {
        viewModel = PokemonDetailViewModel(networking: networking)
    }
    
    private func setupFetch() {
        if ((pokemon?.name) != nil) {
            viewModel.fetchPokemonDetail(pokemon: pokemon.name)
        }
    }
}
