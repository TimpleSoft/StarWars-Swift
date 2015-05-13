//
//  UniverseTableViewController.swift
//  StarWarsSwift
//
//  Created by Timple Soft on 13/5/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

import UIKit

// Protocolo delegado de UniverseTableViewController
protocol UniverseTableViewControllerDelegate{
    
    func starWarsViewController(swvc: UniverseTableViewController, didSelectCharacter: StarWarsCharacter)
    
}


class UniverseTableViewController: UITableViewController {
    
    static let CHARACTER_KEY = "characterKey"
    static let CHARACTER_DID_CHANGE_NOTIFICATION = "characterDidChange"
    
    
    let model = StarWarsUniverse()
    weak var delegate : StarWarsCharacterViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "StarWars Universe"
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        if section == StarWarsUniverse.IMPERIAL_SECTION{
            return model.imperialsCount()
        }
        else{
            return model.rebelsCount()
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let character : StarWarsCharacter
        if (indexPath.section == StarWarsUniverse.IMPERIAL_SECTION){
            character = model.imperialAtIndex(indexPath.row)
        }else{
            character = model.rebelAtIndex(indexPath.row)
        }
        
        let cellId = "StarWarsCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as! UITableViewCell?
        if (cell == nil){
            cell = Optional(UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellId))
        }
        
        // Configure the cell...
        cell?.imageView?.image = character.image
        cell?.textLabel?.text = character.alias
        cell?.detailTextLabel?.text = character.name

        return cell!
    }
    
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == StarWarsUniverse.IMPERIAL_SECTION){
            return "Imperials"
        }else{
            return "Rebels"
        }
    }
    
    
    // MARK: Delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let character : StarWarsCharacter
        if (indexPath.section == StarWarsUniverse.IMPERIAL_SECTION){
            character = model.imperialAtIndex(indexPath.row)
        }else{
            character = model.rebelAtIndex(indexPath.row)
        }
        
        // si tenemos delegado se lo enviamos a el, si no lo cargamos en el nuestro
        if let delegate = self.delegate{
            delegate.starWarsViewController(self, didSelectCharacter: character)
        }
        else{
            let charVC = StarWarsCharacterViewController(model: character, nibName: "StarWarsCharacterViewController", bundle: nil)
            self.navigationController?.pushViewController(charVC, animated: true)
        }
        
        // mandamos notificacion
        let notificationCenter = NSNotificationCenter.defaultCenter()
        let dict = [UniverseTableViewController.CHARACTER_KEY: character]
        notificationCenter.postNotification(NSNotification(name: UniverseTableViewController.CHARACTER_DID_CHANGE_NOTIFICATION,
            object: self,
            userInfo: dict))
        
        // guardamos las coordenadas para arrancar la app con este personaje
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(indexPath.section, forKey: AppDelegate.LAST_SELECTED_CHARACTER_SECTION)
        userDefaults.setObject(indexPath.row, forKey: AppDelegate.LAST_SELECTED_CHARACTER_ROW)
        userDefaults.synchronize()
        
    }
    
}

