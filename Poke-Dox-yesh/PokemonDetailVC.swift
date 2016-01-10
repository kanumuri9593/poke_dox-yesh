//
//  PokemonDetailVC.swift
//  Poke-Dox-yesh
//
//  Created by Yeswanth varma Kanumuri on 1/9/16.
//  Copyright © 2016 Yeswanth varma Kanumuri. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    
    var pokemon : Pokemon!
    
    @IBOutlet weak var PokemonNameLbl: UILabel!
    @IBOutlet weak var mainImgLbl: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLabl: UILabel!
    @IBOutlet weak var defenceLbl: UILabel!
    @IBOutlet weak var hieghtLbl: UILabel!
    @IBOutlet weak var pokeDexIdLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var nextEvolutionLbl: UILabel!
    @IBOutlet weak var evolutionOneImg: UIImageView!
    @IBOutlet weak var evolutionTwoImg: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PokemonNameLbl.text = pokemon.name
        let img  = UIImage(named: "\(pokemon.pokedexId)")

        mainImgLbl.image = img
        evolutionOneImg.image = img
        pokemon.downloadPokeDetails { () -> () in
            
            self.updateUi()
            
        }

       
    }
    
    func updateUi () {
    
       
    
        descriptionLbl.text = pokemon.description
        typeLabl.text = pokemon.type
        defenceLbl.text = pokemon.defence
        hieghtLbl.text = pokemon.height
       weightLbl.text = pokemon.weight
        baseAttackLbl.text = pokemon.attack
        pokeDexIdLbl.text = "\(pokemon.pokedexId)"
        
        
        if pokemon.nextevolutinId == "" {
        
        nextEvolutionLbl.text = "There is no Evolution"
            evolutionTwoImg.hidden = true
        }else {
        
        evolutionTwoImg.hidden = false
            evolutionTwoImg.image = UIImage(named: pokemon.nextevolutinId)
            
            
            var str = "Next Evolution : \(pokemon.nextevolutionTxt)"
            
            if pokemon.nextevolutionLevle != "" {
            
            str +=   "- LVL \(pokemon.nextevolutionLevle)"
                
            }
            
        
        }
        
        
        
        
    
    
    
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
