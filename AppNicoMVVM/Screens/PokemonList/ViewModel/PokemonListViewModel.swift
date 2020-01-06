//
//  PokemonListViewModel.swift
//  AppNicoMVVM
//
//  Created by Gustavo Lembert da Cunha on 03/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import Foundation

protocol PokemonListViewModelProtocol: AnyObject {
    var networking: PokemonListNetworking { get set }
    var pokemons: [Pokemon] { get set }
    var reloadTableView: () -> Void { get set }
    
    func fetchPokemons(offset: Int, limit: Int)
    func getElementsCount() -> Int
    func pokemonPerLine(row: Int) -> Pokemon?
}

class PokemonListViewModel: PokemonListViewModelProtocol {
    
    // MARK: - Properties
    var pokemons: [Pokemon] = []
    var networking: PokemonListNetworking
    var reloadTableView: () -> Void = {}
    
    // MARK: - Lifecycle
    init(networking: PokemonListNetworking) {
        self.networking = networking
    }
    
    //MARK: - Functions
    func fetchPokemons(offset: Int, limit: Int) {
        networking.getPokemons(offset: offset, limit: limit) { [weak self] result in
            switch result {
            case .success(let pokemonResponse):
                if let newPokemons = self?.mapNewPokemons(pokemonResponse.results) {
                    if offset == 0 {
                        self?.pokemons = newPokemons
                    } else {
                        self?.pokemons.append(contentsOf: newPokemons)
                    }
                }
                
                self?.reloadTableView()
            case .error(let error):
                print(error)
            }
        }
    }
    
    func mapNewPokemons(_ pokemons: [Pokemon]) -> [Pokemon] {
        let result = pokemons.map { pokemon -> Pokemon in
            return Pokemon(name: pokemon.name)
        }
    
        return result
    }
    
    func getElementsCount() -> Int {
        return pokemons.count
    }
    
    func pokemonPerLine(row: Int) -> Pokemon? {
        if pokemons.indices.contains(row) {
            return pokemons[row]
        } else {
            return nil
        }
    }
}
