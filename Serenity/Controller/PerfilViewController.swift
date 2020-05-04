//
//  PerfilViewController.swift
//  Serenity
//
//  Created by Noyalle Pereira on 5/3/20.
//  Copyright © 2020 Noyalle Pereira. All rights reserved.
//

import UIKit


class PerfilViewController: UIViewController {
    
    
    @IBOutlet weak var newNameUser: UILabel!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var emergencyContact: UILabel!
    @IBOutlet weak var textFieldEmergency: UITextField!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       // print("Printando aqui")
        
        
    }
    
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        //pegar dados que estao no textField que tem o nome e salvar numa variavel
        
        //pegar dados que estao no textField que tem o contato de emergencia e salvar numa variavel
        
    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
