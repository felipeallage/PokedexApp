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

protocol PokeListCellProtocol {
    typealias SpriteResponse = (Result<PokemonSprites, ErrorApi>) -> Void
    func getSprites(url: String, completion: @escaping SpriteResponse)
    
}

class PokeListService: PokeListCellProtocol {
    func getSprites(completion: @escaping SpriteResponse) {
        API.shared.sendRequest(url: <#T##String#>, completion: <#T##(Result<Decodable & Encodable, ErrorApi>) -> Void#>)
    }
    
    
}

class PokeListTableViewCellModel {
    
    let pokemonEntry: PokemonEntry
    
    let pokemonApi = API()
    
    var delegate: PokelistTableViewCellModelDelegate?
    
    init(pokemonEntry: PokemonEntry) {
        self.pokemonEntry = pokemonEntry
        
    }
    
    func getImageURL() {
        api.getPokemonSprite(url: pokemonEntry.url) { result in
            switch result {
            case .success(let sprites):
                self.delegate?.getImageURL(url: sprites.front_shiny)
            case .failure(_):
                break
                
            }
        }
    }
    
    func getName() -> String {
        return pokemonEntry.name
    }

}
