//
//  Stats.swift
//  Pokedex
//
//  Created by Keertiraj Laxman Malik on 14/11/22.
//

import Foundation

struct Stats: Decodable {
    var HP: Int
    var Attack: Int
    var Defence: Int
    var Sp_Atk: Int
    var Sp_Def: Int
    var Speed: Int
    var Total: Int {
        HP + Attack + Defence + Sp_Atk + Sp_Def + Speed
    }

    enum CodingKeys: String, CodingKey {
        case HP = "hp"
        case Attack = "attack"
        case Defence = "defence"
        case Sp_Atk = "special-attack"
        case Sp_Def = "special-defence"
        case Speed = "speed"
    }

    func allProperties() -> [String: Int] {
        var result: [String: Int] = [:]
        let mirror = Mirror(reflecting: self)
        for (property, value) in mirror.children {
            guard let property = property else {
                continue
            }
            result[property] = value as? Int
        }

        return result
    }
}
