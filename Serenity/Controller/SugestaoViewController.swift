//
//  ViewController.swift
//  Serenity
//
//  Created by Alley Pereira on 4/28/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class SugestaoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var salutation = String()
        let date: Date = Date()
        let calendar: Calendar = Calendar.current
        let hour: Int = calendar.component(.hour, from: date)
        
        let bonsoir = 3
        let afternoon = 12
        let night = 18
        
        print("Hour: \(hour)")
        if bonsoir <= hour, hour < afternoon {
            salutation = "Bom dia"
            
        } else if afternoon <= hour, hour < night {
            salutation = "Boa tarde"
            
        } else {
            salutation = "Boa noite"
        }
        
        print(salutation)
        
    }
    
}

