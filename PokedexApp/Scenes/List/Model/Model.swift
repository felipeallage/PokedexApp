//
//  Model.swift
//  PokedexApp
//
//  Created by Admin on 4/7/22.
//

import Foundation

struct Pokemon: Codable {
    var next: String
    var results : [PokemonEntry]
}

struct PokemonEntry: Codable {
    var name: String
    var url: String
}

struct PokemonSelected: Codable {
    var name: String
    var sprites: PokemonSprites
    var height: Int
    var weight: Int
   var types: [PokemonTypeList]
}

struct PokemonSprites: Codable {
    var front_default: String
    var front_shiny: String
}

struct PokemonTypeList: Codable {
    var slot: Int
//    var type: [PokemonType]
}

struct PokemonType: Codable {
    var name: String
}

enum ErrorApi: Error {
    case linkError
    case genericError
}
