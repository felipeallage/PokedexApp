//
//  ListViewModel.swift
//  PokedexApp
//
//  Created by Admin on 4/7/22.
//

import Foundation
import CoreAudio

protocol PokeListViewModelDelegate {
    
    func didSucess()
    
    func didFailure(error: ErrorApi)
    
}

class PokeService: PokemonListProtocol {
    func getPokemon(completion: @escaping PokemonResponse) {
        API.shared.sendRequest(url: "https://pokeapi.co/api/v2/pokemon?limit=151", completion: completion)
    }
}

protocol PokemonListProtocol {
    typealias PokemonResponse = (Result<[PokemonEntry], ErrorApi>) -> Void
    func getPokemon(completion: @escaping PokemonResponse)
}

class PokeListViewModel {
    
    var pokemonList: [PokeListTableViewCellModel] = []
    
    var delegate: PokeListViewModelDelegate?
    
    var pokemonSprite: String?
    
    let pokemonApi: PokemonListProtocol
    
    init(pokemonApi: PokemonListProtocol) {
        self.pokemonApi = pokemonApi
    }
    
    func getPokemonList() {
        pokemonApi.getPokemon { result in
            switch result {
            case .success(let pokemonarray):
                for pokemon in pokemonarray {
                    self.pokemonList.append(PokeListTableViewCellModel(pokemonEntry: pokemon))
                    self.delegate?.didSucess()
                }
            case .failure(let error):
                self.delegate?.didFailure(error: error)
            }
        }
    }
    
    
//    func getListfromAPI() {
//        api.getData { result in
//            switch result {
//            case let .success(pokemonarray):
//                for pokemon in pokemonarray {
//                    self.pokemonList.append(PokeListTableViewCellModel(pokemonEntry: pokemon))
//                }
//
//                self.delegate?.didSucess()
//            case .failure(let error):
//                self.delegate?.didFailure(error: error)
//            }
//        }
//    }
//
//    func getPokemonImageURL(pokemonURL: String) {
//        api.getPokemonSprite(url: pokemonURL) { result in
//            switch result {
//            case .success(let pokemonSprites):
//                self.pokemonSprite = pokemonSprites.front_shiny
//                self.delegate?.didSucess()
//            case .failure(let error):
//                self.delegate?.didFailure(error: error)
//            }
//        }
//    }
//    func getPokemonSprite() -> String {
//        if let sprite = self.pokemonSprite {
//            return sprite
//        }
//        return ""
//    }
    
    func getPokemonCellViewModel(index: IndexPath) -> PokeListTableViewCellModel {
        return pokemonList[index.row]
    }
    
    func numberOfCells() -> Int {
        return pokemonList.count
    }
    
    func getPokemonWithIndex(index: IndexPath) -> PokemonEntry {
        return pokemonList[index.row].pokemonEntry
    }
    
}



