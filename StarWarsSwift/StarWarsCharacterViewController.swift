//
//  StarWarsCharacterViewController.swift
//  StarWarsSwift
//
//  Created by Timple Soft on 11/5/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

import UIKit

class StarWarsCharacterViewController: UIViewController {

    @IBOutlet weak var photo: UIImageView!
    @IBAction func playSound(sender: AnyObject) {
    }
    @IBAction func showWiki(sender: AnyObject) {
    }
    
    var model : StarWarsCharacter?
    
    
    convenience init(model: StarWarsCharacter?, nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        self.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.model = model
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.photo.image = model?.image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
