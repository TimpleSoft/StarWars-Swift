//
//  StarWarsCharacterViewController.swift
//  StarWarsSwift
//
//  Created by Timple Soft on 11/5/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

import UIKit

class StarWarsCharacterViewController: UIViewController, UISplitViewControllerDelegate, UniverseTableViewControllerDelegate {
    
    
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

    
    
    // MARK: UISplitViewControllerDelegate
    func splitViewController(svc: UISplitViewController, willChangeToDisplayMode displayMode: UISplitViewControllerDisplayMode) {
        
        // Averiguamos si la tabla se ve
        if (displayMode == UISplitViewControllerDisplayMode.PrimaryHidden){
            
            // tabla oculta, ponemos el botón en la barra de navegación
            self.navigationItem.leftBarButtonItem = svc.displayModeButtonItem()
            
        }else{
            
            // tabla mostrada, oculto el boton
            self.navigationItem.leftBarButtonItem = nil
            
        }
        
    }
    
    
    // MARK: UniverseTableViewControllerDelegate
    func starWarsViewController(swvc: UniverseTableViewController, didSelectCharacter character: StarWarsCharacter){
        
        // Actualizamos el modelo
        self.model = character
        self.syncViewWithModel()
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
