//
//  PokemonDetailViewController.swift
//  AppNicoMVVM
//
//  Created by Gustavo Lembert da Cunha on 03/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import UIKit
import Kingfisher

class PokemonDetailViewController: UIViewController {
    
    // MARK - Outlets
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    
    // MARK: - Properties
    var pokemon: Pokemon!
    private var viewModel: PokemonDetailViewModel!
    private var networking = PokemonDetailNetworking()
    var pokemonDetail: Pokemon!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBind()
        setupFetch()
        setupPokemonDetail()
    }
    
    // MARK: - Functions
    private func setupBind() {
        viewModel = PokemonDetailViewModel(networking: networking)
    }
    
    private func setupFetch() {
        if ((pokemon?.name) != nil) {
            viewModel.fetchPokemonDetail(pokemon: pokemon.name)
        }
    }
    
    private func setupPokemonDetail() {
        viewModel.pokemonDetail.bind { [weak self] pokemonDetails in
            guard let strongSelf = self, let unPokemonDetail = pokemonDetails else { return }
            strongSelf.pokemonDetail = unPokemonDetail
            strongSelf.pokemonName.text = unPokemonDetail.name
        }
    }
}
