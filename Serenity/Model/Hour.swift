//
//  Hour.swift
//  Serenity
//
//  Created by Alley Pereira on 5/2/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit



class Hour {
    
    var salutation = String()
    let date: Date = Date()
    let calendar: Calendar = Calendar.current
    let hour: Int

    let bonsoir = 3
    let afternoon = 12
    let night = 18
    
    init() {
        self.hour = calendar.component(.hour, from: date)
    }
    
    
    
    func welcome() -> String {
        print("Hour: \(hour)")
        if bonsoir <= hour, hour < afternoon {
            salutation = "Bom dia"
            
        } else if afternoon <= hour, hour < night {
            salutation = "Boa tarde"
            
        } else {
            salutation = "Boa noite"
        }

        return salutation
    }
    
}




