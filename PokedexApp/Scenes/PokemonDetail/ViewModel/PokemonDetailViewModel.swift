//
//  PokemonDetailViewModel.swift
//  PokedexApp
//
//  Created by Admin on 4/7/22.
//

import Foundation

protocol PokemonDetailViewModelDelegate {
    
    func didSuccess()
    
    func didFailure(error: ErrorApi)
    
}

class PokemonDetailViewModel {
    
    private var pokemon : PokemonSelected?
    
    var api = PokeAPI()
    
    var delegate : PokemonDetailViewModelDelegate?
    
    func getPokemonName() -> String {
        if let pokemon = pokemon {
            return pokemon.name
        }
        return ""
    }
    
    func getPokemonWeight() -> Int {
        if let pokemon = pokemon {
            return pokemon.weight
        }
        return 0
    }
    
    func getPokemonHeight() -> Int {
        if let pokemon = pokemon {
            return pokemon.height
        }
        return 0
    }
    
    func getPokemonSprite() -> String {
        if let pokemon = pokemon {
            return pokemon.sprites.front_default
        }
        return ""
    }
    
    func getPokemonWithURL(url: String) {
        api.getPokemonSelected(url: url) { result in
            switch result {
            case .success(let pokemon):
                self.pokemon = pokemon
                self.delegate?.didSuccess()
            case .failure(let error):
                self.delegate?.didFailure(error: error)
            }
        }
    }
    
}
