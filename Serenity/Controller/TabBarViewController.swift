//
//  TabBarViewController.swift
//  Serenity
//
//  Created by Gilberto Magno on 01/05/20.
//  Copyright © 2020 Noyalle Pereira. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if core.shared.isNewUser() {
            
            let vc = storyboard?.instantiateViewController(identifier: "welcome") as! OnBoardingViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
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

}


class core {

static let shared = core()

func isNewUser() -> Bool {
    
    
    return !UserDefaults.standard.bool(forKey: "isNewUser")
    
}

func setIsNotNewUser() {
    UserDefaults.standard.set(true, forKey: "isNewUser")
    }
}
