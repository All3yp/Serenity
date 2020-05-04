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
        
        dados.set(textFieldName.text, forKey: "Nome")
        dados.set(textFieldEmergency.text, forKey: "Número")
        
        let callingName =  dados.string(forKey: "Nome")
        let callingNumber = dados.string(forKey: "Número")
            
        print(callingName!)
        print(callingNumber!)
        
        self.dismiss(animated: true, completion: nil)
        
        // Acessando a view controller anterior pq eu nao sei delegate :c
        let controllerAnterior: UITabBarController? = self.navigationController?.presentingViewController as? UITabBarController
        let navigationControllerSelecionadaNaTabBar: UINavigationController? = controllerAnterior?.selectedViewController as? UINavigationController
        let sugestaoViewController: SugestaoViewController? = navigationControllerSelecionadaNaTabBar?.viewControllers.first as? SugestaoViewController
        
        sugestaoViewController?.viewWillAppear(true)
        
        
    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
