//
//  WikiViewController.swift
//  StarWarsSwift
//
//  Created by Timple Soft on 13/5/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController, UIWebViewDelegate {

    var model : StarWarsCharacter?
    var canLoad : Bool = true
    
    // MARK: IBOutlets
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var browser: UIWebView!
    
    
    
    // MARK: Inicializador de conveniencia
    
    convenience init(model: StarWarsCharacter?, nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        self.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.model = model
        self.title = model?.alias.stringByAppendingString(" Wikipedia")
        self.canLoad = true
        
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        // para que no ocupe toda la pantalla dentro de un combinador
        // self.edgesForExtendedLayout
        
        self.browser.delegate = self
        self.syncWithModel()
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self,
            selector: "notifyThatCharacterDidChange:",
            name: UniverseTableViewController.CHARACTER_DID_CHANGE_NOTIFICATION,
            object: nil)
        
    }
    
    func syncWithModel(){
        
        self.canLoad = true
        self.activity.hidden = false
        self.activity.startAnimating()
        
        if let url = self.model?.url {
            self.browser.loadRequest(NSURLRequest(URL: url))
        }
        
    }
    
    
    // MARK: UIWebViewDelegate
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return self.canLoad
    }
    
    
    func webViewDidFinishLoad(webView: UIWebView) {

        self.activity.hidden = true
        self.canLoad = false
        
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        
        self.activity.hidden = true
        let alertView = UIAlertView(title: "Error cargando la URL", message: error.description, delegate: self, cancelButtonTitle: "Aceptar")
        alertView.show()
        
    }
    
    
    // MARK: Notificaciones
    @objc func notifyThatCharacterDidChange(notification: NSNotification){
        
        // Cambiamos el modelo
        var character = notification.userInfo?[UniverseTableViewController.CHARACTER_KEY] as! StarWarsCharacter
        self.model = character
        self.syncWithModel()
        
    }

}
