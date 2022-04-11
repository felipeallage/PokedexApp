//
//  Api.swift
//  PokedexApp
//
//  Created by Admin on 4/7/22.
//

import Foundation

struct PokeAPI {
    
    func getData(completion: @escaping (Result<[PokemonEntry], ErrorApi>) -> Void) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else {
            completion(.failure(.linkError))
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(.failure(.genericError))
                return
            }
            let pokemonList = try! JSONDecoder().decode(Pokemon.self, from: data)
            DispatchQueue.main.async {
                completion(.success(pokemonList.results))
            }
        }.resume()
    }
    
    func getPokemonSelected(url: String, completion: @escaping (Result<PokemonSprites, ErrorApi>) -> ()) {
        guard let url = URL(string: url) else {
            completion(.failure(.linkError))
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(.failure(.genericError))
                return
            }
            let pokemonSprite = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            DispatchQueue.main.async {
                completion(.success(pokemonSprite.sprites))
            }
        }.resume()
    }
}




