//
//  ViewController.swift
//  Poke-Dox-yesh
//
//  Created by Yeswanth varma Kanumuri on 1/9/16.
//  Copyright © 2016 Yeswanth varma Kanumuri. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController , UICollectionViewDelegateFlowLayout ,UICollectionViewDelegate,UICollectionViewDataSource ,UISearchBarDelegate {
    
    @IBOutlet weak var collection :UICollectionView!
    @IBOutlet weak var searchBAr: UISearchBar!
    
    
    var pokemon = [Pokemon]()
    var filteredPokemon = [Pokemon]()
    
    var Insearchmode :Bool = false
    
    
    
    var musicPlayer :AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        searchBAr.delegate = self
        searchBAr.returnKeyType = UIReturnKeyType.Done
        
        ParsePokemonCSV()
        initAudio()
            }
    
    func initAudio () {
    
    
        
        let path = NSBundle.mainBundle().pathForResource("music", ofType: "mp3")!
        
        do {
            
            musicPlayer = try AVAudioPlayer(contentsOfURL: NSURL(string: path)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
        
        } catch let err as NSError {
        
            print(err)
        
        }
    
    
    
    
    }
    
    
    func ParsePokemonCSV () {
    
    
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
        
        do {
        let csv = try CSV(contentsOfURL: path)
            
        let rows = csv.rows
            
            for row in rows {
            
            
                 let pokeID = Int(row["id"]!)!
                 let name = row["identifier"]
            let poke = Pokemon(name: name!, pokedexId: pokeID)
            pokemon.append(poke)
                
                
                
                
            }
        
        } catch let err as NSError {
        
        print(err.debugDescription)
        }
        
        
        
        
        
    }
    
    
    

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("pokeCell", forIndexPath: indexPath) as? pokeCell {
            
            
            
            
            
            var poke :Pokemon!
            
            if Insearchmode{
                
                poke = filteredPokemon[indexPath.row]
            
            } else {
            
            poke = pokemon[indexPath.row]
            
            }
            
            cell.configureCell(poke)
        
        
        return cell
        
        
        }else {
        
            return UICollectionViewCell()
        
        }
        
        
    }

    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
        var poke :Pokemon
        
        if Insearchmode {
        
         poke = filteredPokemon[indexPath.row]
        
        } else {
        
         poke = pokemon[indexPath.row]
        
        }
        
        performSegueWithIdentifier("PokemonDetailVC", sender: poke)
        
        
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if Insearchmode {
        return filteredPokemon.count
        
        }
        return pokemon.count
    }
    
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
         return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        
        return CGSizeMake(105.0, 105.0)
    }
    
    @IBAction func MusicButtonPressed(sender: UIButton!) {
        
        
        if musicPlayer.playing {
        
        musicPlayer.stop()
            sender.alpha = 0.4
        
        
        }else {
        
        musicPlayer.play()
            
            sender.alpha = 1.0
           
        
        }
     
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        
        if searchBAr.text == nil || searchBAr.text == "" {
        
        Insearchmode = false
            
            view.endEditing(true)
            collection.reloadData()
        
        }else {
            
            Insearchmode = true
            
            let lower = searchBAr.text?.lowercaseString
            
            filteredPokemon = pokemon.filter({$0.name.rangeOfString(lower!) != nil })
        collection.reloadData()
        
        }
       
    }
    
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "PokemonDetailVC" {
        
            if let detailsVC = segue.destinationViewController as? PokemonDetailVC {
            
                if let poke = sender as? Pokemon {
                
               
                detailsVC.pokemon = poke
                
                }
            
            
            
            }
        
        
        
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

