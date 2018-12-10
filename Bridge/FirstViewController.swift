//
//  FirstViewController.swift
//  Bridge
//
//  Created by User on 11/4/18.
//  Copyright © 2018 witschgerrj. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var officerLabel: UILabel!
    @IBOutlet weak var authorizationCodeLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var warpDriveLabel: UILabel!
    @IBOutlet weak var warpFactorLabel: UILabel!
    @IBOutlet weak var favoriteTeaLabel: UILabel!
    @IBOutlet weak var favoriteCaptainLabel: UILabel!
    @IBOutlet weak var favoriteGadgetLabel: UILabel!
    @IBOutlet weak var favoriteAlienLabel: UILabel!
    @IBOutlet weak var ownerNameLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func applicationWillEnterForeground(notification:NSNotification) {
        
        let defaults = UserDefaults.standard
        defaults.synchronize()
        refreshFields()
    }
    
    func refreshFields() {
        
        let defaults = UserDefaults.standard
        
        officerLabel.text = defaults.string(forKey: officerKey)
        authorizationCodeLabel.text = defaults.string(forKey: authorizationCodeKey)
        rankLabel.text = defaults.string(forKey: rankKey)
        warpDriveLabel.text = defaults.bool(forKey: warpDriveKey) ? "Engaged" : "Disabled"
        warpFactorLabel.text = (defaults.object(forKey: warpFactorKey) as AnyObject).stringValue
        favoriteTeaLabel.text = defaults.string(forKey: favoriteTeaKey)
        favoriteCaptainLabel.text = defaults.string(forKey: favoriteCaptainKey)
        favoriteGadgetLabel.text = defaults.string(forKey: favoriteGadgetKey)
        favoriteAlienLabel.text = defaults.string(forKey: favoriteAlienKey)
        ownerNameLabel.text = defaults.string(forKey: ownerNameKey)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshFields()
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.applicationWillEnterForeground(notification:)),
                                               name: Notification.Name.UIApplicationWillEnterForeground,
                                               object: app)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

