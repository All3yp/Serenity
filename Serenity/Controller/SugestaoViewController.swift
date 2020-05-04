//
//  ViewController.swift
//  Serenity
//
//  Created by Alley Pereira on 4/28/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit


class SugestaoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let array = ["Exercicios" , "Relax"]
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sugestaoCell", for: indexPath) as! MyCollectionViewCell
        
        cell.imageView.image = UIImage.init(named: array[indexPath.row])
        return cell
    }
    
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var emergencyButton: UIButton!
    
    @IBOutlet weak var collectSetView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        emergencyButton.layer.cornerRadius = 11
        
        collectSetView.delegate = self
        collectSetView.dataSource = self
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        let boasVindas = Hour()
        let salutation = boasVindas.welcome()
        
        
        if let dadosNome = dados.string(forKey: "Nome"), dadosNome != "" {
            welcomeLabel.text = "\(salutation), \(dadosNome)"
        } else {
            welcomeLabel.text = salutation
        }
        
    }
    
    @IBAction func callEmergency(_ sender: UIButton) {
        
        
        print("tel://\(dados.string(forKey: "Número")!)")
        
        if let url = URL(string: "tel://\(dados.string(forKey: "Número")!)"),
            UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            
            print(url)
            
        }
        
    }
    
    
}

