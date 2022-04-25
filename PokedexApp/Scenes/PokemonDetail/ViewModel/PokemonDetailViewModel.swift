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
        return pokemon.sprites?.front_default ?? ""
    }
    
    func getPokemonWithURL() {
        pokemonApi.getPokemonSelected(url: pokemon.url) { result in
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
