//
//  Models.swift
//  StarWarsSwift
//
//  Created by Timple Soft on 11/5/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

import Foundation
import UIKit

// MARK: CLASE STAR WARS CHARACTER
class StarWarsCharacter{
    
    var name : String = ""
    var alias : String = ""
    let image : UIImage?
    let sound : NSData?
    let url : NSURL?
    
    init(name: String, alias: String, image: UIImage?, sound: NSData?, url: NSURL?){
        self.name = name
        self.alias = alias
        self.image = image
        self.sound = sound
        self.url = url
    }
    
    init(alias: String, image: UIImage?, sound: NSData?, url: NSURL?){
        self.alias = alias
        self.image = image
        self.sound = sound
        self.url = url
    }
    
}



// MARK: CLASE STAR WARS UNIVERSE
class StarWarsUniverse{
    
    var rebels : Array<StarWarsCharacter> = []
    var imperials : Array<StarWarsCharacter> = []
    
    static let IMPERIAL_SECTION = 0
    static let REBEL_SECTION = 1
    
    init(){
        // Creamos manualmente los personajes
        // Vader
        if let soundURL = NSBundle.mainBundle().URLForResource("vader", withExtension: "caf"){
            var vader = StarWarsCharacter(name:"Vader",
                alias:"Darth",
                image:UIImage(named: "darthVader.jpg"),
                sound:NSData(contentsOfURL:soundURL),
                url:NSURL(string: "http://en.wikipedia.org/wiki/Darth_Vader"))
            self.imperials.append(vader)
        }
        
        // Tarkin
        if let soundURL = NSBundle.mainBundle().URLForResource("tarkin", withExtension: "caf"){
            var tarkin = StarWarsCharacter(name:"Wilhuf Tarkin",
                alias:"Grand Moff Tarkin",
                image:UIImage(named: "tarkin.jpg"),
                sound:NSData(contentsOfURL:soundURL),
                url:NSURL(string: "http://en.wikipedia.org/wiki/Grand_Moff_Tarkin"))
            self.imperials.append(tarkin)
        }
        
        // Palpatine
        if let soundURL = NSBundle.mainBundle().URLForResource("palpatine", withExtension: "caf"){
            var palpatine = StarWarsCharacter(name:"Palpatine",
                alias:"Darth Sidious",
                image:UIImage(named: "palpatine.jpg"),
                sound:NSData(contentsOfURL:soundURL),
                url:NSURL(string: "http://en.wikipedia.org/wiki/Palpatine"))
            self.imperials.append(palpatine)
        }
        
        // Chewbacca
        if let soundURL = NSBundle.mainBundle().URLForResource("chewbacca", withExtension: "caf"){
            var chewbacca = StarWarsCharacter(alias:"Chewbacca",
                image:UIImage(named: "chewbacca.jpg"),
                sound:NSData(contentsOfURL:soundURL),
                url:NSURL(string: "http://en.wikipedia.org/wiki/Chewbacca"))
            self.rebels.append(chewbacca)
        }
        
        // C-3PO
        if let soundURL = NSBundle.mainBundle().URLForResource("c3po", withExtension: "caf"){
            var c3po = StarWarsCharacter(alias:"C-3PO",
                image:UIImage(named: "c3po.jpg"),
                sound:NSData(contentsOfURL:soundURL),
                url:NSURL(string: "http://en.wikipedia.org/wiki/C-3PO"))
            self.rebels.append(c3po)
        }

        
        // Yoda
        if let soundURL = NSBundle.mainBundle().URLForResource("yoda", withExtension: "caf"){
            var yoda = StarWarsCharacter(name:"Minch Yoda",
                alias:"Master Yoda",
                image:UIImage(named: "yoda.jpg"),
                sound:NSData(contentsOfURL:soundURL),
                url:NSURL(string: "http://en.wikipedia.org/wiki/Yoda"))
            self.rebels.append(yoda)
        }
        
        // R2-D2
        if let soundURL = NSBundle.mainBundle().URLForResource("r2-d2", withExtension: "caf"){
            var r2d2 = StarWarsCharacter(alias:"R2-D2",
                image:UIImage(named: "R2-D2.jpg"),
                sound:NSData(contentsOfURL:soundURL),
                url:NSURL(string: "http://en.wikipedia.org/wiki/R2-D2"))
            self.rebels.append(r2d2)
        }
        
        
            
    }
    
    func rebelsCount() -> Int{
        return rebels.count
    }
    
    func imperialsCount() -> Int{
        return imperials.count
    }
    
    func rebelAtIndex(index : Int) -> StarWarsCharacter{
        return self.rebels[index]
    }
    
    func imperialAtIndex(index : Int) -> StarWarsCharacter{
        return self.imperials[index]
    }
    
}
