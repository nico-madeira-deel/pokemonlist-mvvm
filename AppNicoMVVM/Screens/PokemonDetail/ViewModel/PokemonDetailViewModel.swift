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
    func fetchPokemonDetail()
}

class PokemonDetailViewModel: PokemonDetailViewModelProtocol {
    
    // MARK: - Properties
    var networking: PokemonDetailNetworking
    var pokemonDetail: Observable<Pokemon?>
    var pokemon: Pokemon
    
    // MARK: - Lifecycle
    init(networking: PokemonDetailNetworking, pokemon: Pokemon) {
        self.networking = networking
        self.pokemonDetail = Observable(nil)
        self.pokemon = pokemon
    }
    
    // MARK: - Functions
    func fetchPokemonDetail() {
        networking.getPokemonDetail(pokemon: pokemon.name) { [weak self] result in
            switch result {
            case .success(let pokemonDetailResponse):
                pokemonDetailResponse.imageUrl = self?.pokemon.imageUrl
                self?.pokemonDetail.value = pokemonDetailResponse
            case .error(let error):
                print("deu ruim", error)
            }
        }
    }
}
