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
    private var _type : String!
    private var _description : String!
    private var _defence : String!
    private var _height : String!
    private var _weight : String!
    private var _attack : String!
    private var _nextEvolutionTxt : String!
    

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