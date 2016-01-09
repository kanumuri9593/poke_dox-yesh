//
//  pokemon.swift
//  Poke-Dox-yesh
//
//  Created by Yeswanth varma Kanumuri on 1/9/16.
//  Copyright © 2016 Yeswanth varma Kanumuri. All rights reserved.
//

import Foundation

class Pokemon {

    private var _name : String!
    private var _pokeDexId : Int!

    var name :String {
    
        return _name
    
    }
    var pokedexId : Int {
    return _pokeDexId
    }
    
    init (name : String , pokedexId : Int) {
    
    self._name = name
        self._pokeDexId = pokedexId
    
    }

}