//
//  PokemonDetailViewModel.swift
//  AppNicoMVVM
//
//  Created by Tag Livros on 04/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import Foundation
import RxSwift

protocol PokemonDetailViewModelProtocol: AnyObject {
    var networking: PokemonDetailNetworking { get set }
    func fetchPokemonDetail()
}

class PokemonDetailViewModel: PokemonDetailViewModelProtocol {
    
    // MARK: - Properties
    var networking: PokemonDetailNetworking
    var pokemonDetail: BehaviorSubject<Pokemon?>
    var errorMessage: BehaviorSubject<Error?>
    
    // MARK: - Lifecycle
    init(networking: PokemonDetailNetworking, pokemon: Pokemon) {
        self.networking = networking
        self.pokemonDetail = BehaviorSubject(value: nil)
        self.errorMessage = BehaviorSubject(value: nil)
    }
    
    // MARK: - Functions
    func fetchPokemonDetail() {
        networking.getPokemonDetail(pokemon: pokemon.name) { [weak self] result in
            switch result {
            case .success(let pokemonDetailResponse):
                self?.pokemonDetail.onNext(pokemonDetailResponse)
            case .error(let error):
                self?.errorMessage.onNext(error)
            }
        }
    }
}
