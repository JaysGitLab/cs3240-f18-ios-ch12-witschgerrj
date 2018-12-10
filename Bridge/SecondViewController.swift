//
//  SecondViewController.swift
//  Bridge
//
//  Created by User on 11/4/18.
//  Copyright © 2018 witschgerrj. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var engineSwitch: UISwitch!
    @IBOutlet weak var warpFactorSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func applicationWillEnterForeground(notification:NSNotification) {
        let defaults = UserDefaults.standard
        defaults.synchronize()
        refreshFields()
    }
    
    @IBAction func onWarpSliderDragged(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(warpFactorSlider.value, forKey: warpFactorKey)
        defaults.synchronize()
    }
    
    @IBAction func onSettingsButtonTapped(_ sender: AnyObject) {
        let application = UIApplication.shared
        let url = URL(string: UIApplicationOpenSettingsURLString)! as URL
        if application.canOpenURL(url) {
            application.open(url, options:["":""] , completionHandler: nil)
        }
    }
    
    @IBAction func onEngineSwitchTapped(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(engineSwitch.isOn, forKey: warpDriveKey)
        defaults.synchronize()
        
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
    
    
    func refreshFields() {
        let defaults = UserDefaults.standard
        engineSwitch.isOn = defaults.bool(forKey: warpDriveKey)
        warpFactorSlider.value = defaults.float(forKey: warpFactorKey)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

