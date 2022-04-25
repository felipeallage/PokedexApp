//
//  Service.swift
//  PokedexApp
//
//  Created by Admin on 4/19/22.
//

import Foundation


protocol PokeServiceProtocol {
    
    typealias PokemonListResponse = (Result<Pokemon, ErrorApi>) -> Void
    typealias PokemonSpriteResponse = (Result<PokemonSprites, ErrorApi>) -> Void
    typealias PokemonSelectedResponse = (Result<PokemonEntry, ErrorApi>) -> Void
    
    func getPokemon(completion: @escaping PokemonListResponse)
    func getSprite(url: String, completion: @escaping PokemonSpriteResponse)
    func getPokemonSelected(url: String, completion: @escaping PokemonSelectedResponse)
    
}


class PokeService: PokeServiceProtocol {
    
    func getPokemonSelected(url: String, completion: @escaping PokemonSelectedResponse) {
        API.shared.sendRequest(url: url, completion: completion)
    }
    
    func getSprite(url: String, completion: @escaping PokemonSpriteResponse) {
        API.shared.sendRequest(url: url, completion: completion)
    }
    
    func getPokemon(completion: @escaping PokemonListResponse) {
        API.shared.sendRequest(url: "https://pokeapi.co/api/v2/pokemon?limit=151", completion: completion)
    }
}

