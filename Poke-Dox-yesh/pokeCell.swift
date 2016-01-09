//
//  pokeCell.swift
//  Poke-Dox-yesh
//
//  Created by Yeswanth varma Kanumuri on 1/9/16.
//  Copyright © 2016 Yeswanth varma Kanumuri. All rights reserved.
//

import UIKit

class pokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var pokemon : Pokemon!
    
    
    func configureCell (pokemon : Pokemon){
    
    
    self.pokemon = pokemon
        
        nameLabel.text = self.pokemon.name.capitalizedString
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
    
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
