//
//  Api.swift
//  PokedexApp
//
//  Created by Admin on 4/7/22.
//

import Foundation

struct API {
    
    static let shared = API()
    
    func sendRequest<T: Codable>(url: String, completion: @escaping (Result<T, ErrorApi>) -> Void) {
        guard let finalURL = URL(string: url) else {
            completion(.failure(.linkError))
            return
        }
        let request = URLRequest(url:finalURL)
        let _: Void = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(.failure(.genericError))
                return
            }
            let responseModel = try! JSONDecoder().decode(T.self, from: data)
            completion(.success(responseModel))
        }.resume()
    }
}

    
//    func getData<T: Codable>(url: String, completion: @escaping (Result<T,ErrorApi>) -> Void) {
//        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else {
//            completion(.failure(.linkError))
//            return
//        }
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let data = data else {
//                completion(.failure(.genericError))
//                return
//            }
//            let responseModel = try! JSONDecoder().decode(T.self, from: data)
//            DispatchQueue.main.async {
//                completion(.success(responseModel))
//            }
//        }.resume()
//    }
    
//    func getPokemonSprite(url: String, completion: @escaping (Result<PokemonSprites, ErrorApi>) -> ()) {
//        guard let url = URL(string: url) else {
//            completion(.failure(.linkError))
//            return
//        }
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let data = data else {
//                completion(.failure(.genericError))
//                return
//            }
//            let pokemonSprite = try! JSONDecoder().decode(PokemonSelected.self, from: data)
//            DispatchQueue.main.async {
//                completion(.success(pokemonSprite.sprites))
//            }
//        }.resume()
//    }
//
//    func getPokemonSelected(url: String, completion: @escaping (Result<PokemonSelected, ErrorApi>) -> ()) {
//        guard let url = URL(string: url) else {
//            completion(.failure(.linkError))
//            return
//        }
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let data = data else {
//                completion(.failure(.genericError))
//                return
//            }
//            let pokemonSelected = try! JSONDecoder().decode(PokemonSelected.self, from: data)
//            DispatchQueue.main.async {
//                completion(.success(pokemonSelected))
//            }
//        }.resume()
//    }





