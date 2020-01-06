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
    private var viewModel: PokemonDetailViewModel!
    private var networking = PokemonDetailNetworking()
    var pokemon: Pokemon!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBind()
        setupFetch()
        setupPokemonDetail()
    }
    
    // MARK: - Functions
    private func setupBind() {
        viewModel = PokemonDetailViewModel(networking: networking, pokemon: pokemon)
    }
    
    private func setupFetch() {
        viewModel.fetchPokemonDetail()
    }
    
    private func setupPokemonDetail() {
        viewModel.pokemonDetail.bind { [weak self] pokemonDetails in
            guard let strongSelf = self, let unPokemonDetail = pokemonDetails else { return }
            strongSelf.pokemonName.text = unPokemonDetail.name
            print(unPokemonDetail)
        }
    }
}
