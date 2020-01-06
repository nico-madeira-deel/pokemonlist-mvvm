//
//  PokemonDetailViewController.swift
//  AppNicoMVVM
//
//  Created by Gustavo Lembert da Cunha on 03/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import UIKit
import Kingfisher
import RxSwift

class PokemonDetailViewController: UIViewController {
    
    // MARK - Outlets
    @IBOutlet weak var pokemonName: UILabel!
    
    // MARK: - Properties
    private var viewModel: PokemonDetailViewModel!
    private var networking = PokemonDetailNetworking()
    private let disposeBag = DisposeBag()
    var pokemon: Pokemon!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBind()
        setupFetch()
    }
    
    // MARK: - Functions
    private func setupBind() {
        viewModel = PokemonDetailViewModel(networking: networking, pokemon: pokemon)
  
        viewModel.pokemonDetail.subscribe({ [weak self] response in
            guard let unElement = response.element, let unPokemon = unElement else { return }
            self?.pokemonName.text = unPokemon.name
        }).disposed(by: disposeBag)
    }
    
    private func setupFetch() {
        viewModel.fetchPokemonDetail()
    }
}
