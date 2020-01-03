//
//  PokemonListNetworking.swift
//  AppNicoMVVM
//
//  Created by Gustavo Lembert da Cunha on 03/01/20.
//  Copyright © 2020 Pedro Ullmann. All rights reserved.
//

import Foundation
import Alamofire

enum Result<T> {
    case success(T)
    case error(Error)
}

protocol PokemonListNetworkingProtocol: AnyObject {
    func getPokemons(offset: Int, limit: Int, completion: @escaping (Result<PokemonResponse>) -> Void)
}

class PokemonListNetworking: PokemonListNetworkingProtocol {
    func getPokemons(offset: Int, limit: Int, completion: @escaping (Result<PokemonResponse>) -> Void) {
        
        var parameters: [String: Any] = [:]
        parameters["offset"] = offset
        parameters["limit"] = limit
        
        request("https://pokeapi.co/api/v2/pokemon/",
                method: .get,
                parameters: parameters,
                encoding: URLEncoding.default,
                headers: nil).responseJSON { response in
            switch response.result {
            case .success:
                do {
                    let decoder = JSONDecoder()
                    let pokemonResponse = try decoder.decode(PokemonResponse.self, from: response.data!)
                    completion(Result.success(pokemonResponse))
                } catch let error {
                    completion(Result.error(error))
                }
            case .failure(let error):
                completion(Result.error(error))
            }
        }
    }
}
