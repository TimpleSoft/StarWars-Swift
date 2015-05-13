//
//  StarWarsCharacterViewController.swift
//  StarWarsSwift
//
//  Created by Timple Soft on 11/5/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

import UIKit

class StarWarsCharacterViewController: UIViewController {
    
    
    var model : StarWarsCharacter?
    
    
    // MARK: Outlets & Actions

    @IBOutlet weak var photo: UIImageView!
    
    
    @IBAction func playSound(sender: AnyObject) {
        
        var player = CafPlayer()
        player.playSoundData(model?.sound)
    
    }
    
    @IBAction func showWiki(sender: AnyObject) {
        
        var wikiVC = WikiViewController(model: self.model, nibName: "WikiViewController", bundle: nil)
        self.navigationController?.pushViewController(wikiVC, animated: true)
        
    }
    
    // MARK: Inicializador de conveniencia
    
    convenience init(model: StarWarsCharacter?, nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        self.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.model = model
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.syncViewWithModel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func syncViewWithModel(){
        self.title = self.model?.alias
        self.photo.image = self.model?.image
    }

}
