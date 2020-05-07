//
//  ExerciciosViewControler.swift
//  Serenity
//
//  Created by Alley Pereira on 4/29/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit


class ExerciciosViewController: UIViewController{
    
    let exerciciosCollection = ["Exercicios", "Alongamento", "Respiracao"]
 
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(ItemCollectionViewCell.xibForCollection(), forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
        
        print("Exercicios View Controller")
        
    }
}

extension ExerciciosViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exerciciosCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as? ItemCollectionViewCell else{
            fatalError("Wrong idetifier")
        }
        cell.itemTitleLabel.text = "\(exerciciosCollection[indexPath.row])"
        cell.itemImage.image = UIImage(named: exerciciosCollection[indexPath.row])
        
        return cell
    }
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize{
    return CGSize(width: view.frame.width*(343/414), height: view.frame.height*(209/896))
    }
    
}
