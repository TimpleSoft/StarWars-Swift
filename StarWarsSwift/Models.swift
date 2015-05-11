//
//  Models.swift
//  StarWarsSwift
//
//  Created by Timple Soft on 11/5/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

import Foundation
import UIKit

// CLASE STAR WARS CHARACTER
class StarWarsCharacter{
    
    let name : String
    let alias : String
    let image : UIImage
    let sound : NSData
    let url : NSURL
    
    init(name: String, alias: String, image: UIImage, sound: NSData, url: NSURL){
        self.name = name
        self.alias = alias
        self.image = image
        self.sound = sound
        self.url = url
    }
    
}


/*
class StarWarsUniverse{
    
    let rebels : Array<StarWarsCharacter>
    let imperials : Array<StarWarsCharacter>
    
    init(){
        // Creamos manualmente los personajes
        
    }
    
    func rebelsCount() -> Int{
        return rebels.count
    }
    
    func imperialsCount() -> Int{
        return imperials.count
    }
    
}
*/