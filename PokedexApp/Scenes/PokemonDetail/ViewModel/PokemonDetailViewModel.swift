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
    
    private var pokemon : PokemonEntry
    
    let pokemonApi : PokeServiceProtocol
    
    var delegate : PokemonDetailViewModelDelegate?
    
    init(pokemon: PokemonEntry, pokemonApi: PokeServiceProtocol = PokeService()) {
        self.pokemonApi = pokemonApi
        self.pokemon = pokemon
    }
    
    func getPokemonName() -> String {
            return pokemon.name
    }
    
    func getPokemonWeight() -> Int {
        return pokemon.weight ?? 0
    }
    
    func getPokemonHeight() -> Int {
            return pokemon.height ?? 0
    }
    
    func getPokemonSprite() -> String {
        if let sprites = pokemon.sprites, let front = sprites.front_default {
            return front
        }
        return ""
    }
    
    func getPokemonWithURL() {
        guard let url = pokemon.url else {
            return
            }
        pokemonApi.getPokemonSelected(url: url) { result in
            DispatchQueue.main.async {
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
    
}
