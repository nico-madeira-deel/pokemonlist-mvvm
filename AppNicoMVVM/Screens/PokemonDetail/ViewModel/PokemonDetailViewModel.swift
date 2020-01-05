//
//  PokemonDetailViewModel.swift
//  AppNicoMVVM
//
//  Created by Tag Livros on 04/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import Foundation

protocol PokemonDetailViewModelProtocol: AnyObject {
    var networking: PokemonDetailNetworking { get set }
    var pokemonDetail: PokemonDetail? { get set }
    func fetchPokemonDetail(pokemon: String)
}

class PokemonDetailViewModel: PokemonDetailViewModelProtocol {
    
    // MARK: - Properties
    var networking: PokemonDetailNetworking
    var pokemonDetail: PokemonDetail?
    
    // MARK: - Lifecycle
    init(networking: PokemonDetailNetworking) {
        self.networking = networking
    }
    
    // MARK: - Functions
    func fetchPokemonDetail(pokemon: String) {
        networking.getPokemonDetail(pokemon: pokemon) { [weak self] result in
            switch result {
            case .success(let pokemonDetailResponse):
                self?.pokemonDetail = pokemonDetailResponse.result
            case .error(let error):
                print("deu ruim", error)
            }
        }
    }
}
