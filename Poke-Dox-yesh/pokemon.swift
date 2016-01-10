//
//  pokemon.swift
//  Poke-Dox-yesh
//
//  Created by Yeswanth varma Kanumuri on 1/9/16.
//  Copyright © 2016 Yeswanth varma Kanumuri. All rights reserved.
//

import Foundation
import Alamofire

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
    private var _nextevolutionId : String!
    private var _nextevolutionlevel : String!
    private var _pokemonUrl :String!
    
    var type : String {
        
        if _type == nil {
        _type = ""
        }
    
    return _type
    }
    var description :String{
        if _description == nil{
        _description = ""
        }
    return _description
    }
    var defence :String{
        if _defence == nil {
        
        _defence = ""
        }
    
    return _defence
    }
    var height :String {
        if _height == nil {
         _height = ""
        }
    
    return _height
    }
    var weight : String{
        if _weight == nil {
        _weight = ""
        }
    
    
    return _weight
    }
    var attack :String{
        
        if _attack == nil {
        _attack = ""
        }
        return _attack
    }
    var nextevolutionTxt :String{
        if _nextEvolutionTxt == nil {
        _nextEvolutionTxt = ""
        }
    
    return _nextEvolutionTxt
    }
    var nextevolutinId :String{
        
        if _nextevolutionId == nil {
        
        _nextevolutionId = ""
        }
    
    return _nextevolutionId
    }
    var nextevolutionLevle:String {
        
        if _nextevolutionlevel == nil {
        
        _nextevolutionlevel = ""
        }
    
    return _nextevolutionlevel
    }
    var name :String {
        
        if _name == nil {
        
        _name = ""
        }
    
        return _name
    
    }
    var pokedexId : Int {
        
        if _pokeDexId == nil {
        
        _pokeDexId = 0
        }
    return _pokeDexId
    }
    
    init (name : String , pokedexId : Int) {
    
    self._name = name
        self._pokeDexId = pokedexId
        
        _pokemonUrl = "\(URIL_BASE)\(URL_POKEMON)\(self._pokeDexId)/"
    
    }

    
    
    func downloadPokeDetails (completed :DownloadComplete) {
    
    
        let url = NSURL(string: _pokemonUrl)!
        
        Alamofire.request(.GET, url).responseJSON { response in
        
        let result = response.result
            
          //  print(result.value.debugDescription)
            
            
            if let dict = result.value as? Dictionary<String , AnyObject> {
            
                if let weight = dict["weight"] as? String {
                
                self._weight = weight
                
                }
                if let height  = dict["height"] as? String {
                self._height = height
                
                }
                if let defense = dict["defense"] as? Int {
                
                self._defence = "\(defense)"
                    
                
                }
                if let attack = dict["attack"] as? Int {
                
                self._attack = "\(attack)"
                
                }
                
                print(self._attack)
                
                if let types = dict["types"] as? [Dictionary<String , String>] where types.count > 0 {
                
                //print(types.debugDescription)
                    if let type = types[0]["name"] {
                    
                    self._type = type.capitalizedString
                    
                    }
                    if types.count > 1 {
                    
                        for var x = 1 ; x <  types.count ; x++ {
                        
                            if let type = types[x]["name"] {
                            
                            self._type! += "/\(type.capitalizedString)"
                            }
                        
                        }
                    
                    }
                
                }else {
                
                self._type = ""
                }
            print(self._type)
                
                if let descArr = dict["descriptions"] as? [Dictionary<String , String>] where descArr.count > 0 {
                
                    if let descUrl = descArr[0]["resource_uri"]  {
                    
                    let nsurl = NSURL(string: "\(URIL_BASE)\(descUrl)")!
                        
                        Alamofire.request(.GET, nsurl).responseJSON {
                        
                        response in
                            
                            let descresult = response.result
                        
                            if let pokeDesc = descresult.value as? Dictionary<String , AnyObject> {
                            
                                if let description = pokeDesc["description"] as? String {
                                
                                self._description = description
                                    print(self._description)
                                }
                            
                            }
                        
                            completed()
                        }
                    
                    }
                
                
                }else {
                self._description =  ""
                }
                
                if let evolutions = dict["evolutions"] as? [Dictionary<String ,AnyObject>]where evolutions.count > 0 {
                
                    if let to = evolutions[0]["to"] as? String{
                        
                        
                    
                        if to.rangeOfString("mega") == nil {
                        
                        //mega is not fount
                        // this app cannot display mega evolutions
                            
                            if let uri = evolutions[0]["resource_uri"] as? String {
                            
                            let newuri = uri.stringByReplacingOccurrencesOfString("/api/v1/pokemon/", withString: "")
                            
                            let num = newuri.stringByReplacingOccurrencesOfString("/", withString: "")
                                
                               self._nextevolutionId = num
                                self._nextEvolutionTxt = to
                                
                                if let level = evolutions[0]["level"] as? Int {
                                
                                self._nextevolutionlevel = "\(level)"
                                
                                }
                                
                                print(self._nextevolutionlevel)
                                print(self._nextEvolutionTxt)
                                print(self._nextevolutionId)
                            
                            }
                        
                        
                        }
                    
                    
                    }
                
                }
                
            }
            
          
        
        }
    
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
}