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
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonInfo: UILabel!
    
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
            let formatPokemonName = unPokemon.name.capitalizingFirstLetter()
            self?.pokemonName.text = formatPokemonName
            self?.navigationItem.title = formatPokemonName
            if let unHeightPokemon = unPokemon.height,
                let unWeigthPokemon = unPokemon.weight {
                self?.pokemonInfo.text = "Height: \(unHeightPokemon)  \nWeight: \(unWeigthPokemon)"
            }
            
            if let unImageUrlGif = self?.pokemon.imageUrlGif,
                let unUrl = URL(string: unImageUrlGif) {
                let imageResource = ImageResource(downloadURL: unUrl)
                self?.pokemonImage.kf.setImage(with: imageResource)
            }
                
            if let unType = unPokemon.types,
                let firstType = unType[0].type,
                let nameOfFirstType = firstType.name {
                let backgroundColorByType = Type.getColorByType(type: nameOfFirstType)
                if let unBackgroundColor = backgroundColorByType {
                    self?.view.backgroundColor = unBackgroundColor
                }
            }
            
        }).disposed(by: disposeBag)
    }
    
    private func setupFetch() {
        viewModel.fetchPokemonDetail()
    }
}
