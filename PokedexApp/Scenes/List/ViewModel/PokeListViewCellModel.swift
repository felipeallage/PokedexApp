//
//  PokemonListViewCellModel.swift
//  PokedexApp
//
//  Created by Admin on 4/11/22.
//

import Foundation

protocol PokelistTableViewCellModelDelegate {
    
    func getImageURL(url: String)
    
}


class PokeListTableViewCellModel {
    
    let pokemonEntry: PokemonEntry
    
    let pokemonApi : PokeServiceProtocol
    
    var delegate: PokelistTableViewCellModelDelegate?
    
    init(pokemonEntry: PokemonEntry, pokemonApi: PokeServiceProtocol = PokeService()) {
        self.pokemonEntry = pokemonEntry
        self.pokemonApi = pokemonApi
        
    }
    
    func getImageURL() {
        pokemonApi.getSprite(url: pokemonEntry.url) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let pokemon):
                    self.delegate?.getImageURL(url: pokemon.sprites?.front_default ?? "")
                case .failure(_):
                    break
                }
            }
        }
    }
    
    func getName() -> String {
        return pokemonEntry.name
    }

}
