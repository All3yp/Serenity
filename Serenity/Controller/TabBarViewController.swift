//
//  TabBarViewController.swift
//  Serenity
//
//  Created by Gilberto Magno on 01/05/20.
//  Copyright © 2020 Noyalle Pereira. All rights reserved.
//

import UIKit

extension UserDefaults {
    static var isFirstLaunch: Bool {
        get {
            return !UserDefaults.standard.bool(forKey:"isNewUser")
        }
        set {
            UserDefaults.standard.set(true, forKey:"isNewUser")
        }
    }
    static var isNotFirstLaunch: Bool {
        get{
            isFirstLaunch = true
            return isFirstLaunch
        }
        set{
            UserDefaults.standard.set(true, forKey: "isNewUser")
        }
    }
    
}

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
