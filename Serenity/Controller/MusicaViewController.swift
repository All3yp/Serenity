//
//  MusicaViewController.swift
//  Serenity
//
//  Created by Alley Pereira on 4/29/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class MusicaViewController: UIViewController {
    
    @IBOutlet weak var tableViewMusic: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: "CardTableViewCell", bundle: .main)
        tableViewMusic.register(cellNib, forCellReuseIdentifier: CardTableViewCell.identifier)
        
        tableViewMusic.separatorStyle = .none
        
        tableViewMusic.delegate = self
        tableViewMusic.dataSource = self
        
    }
    
}

extension MusicaViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableViewMusic.dequeueReusableCell(withIdentifier: CardTableViewCell.identifier) as! CardTableViewCell
        
        if indexPath.row == 0 {
            cell.labelCard.text = "Sons Ambientes"
            cell.imageCard.image = UIImage(named: "Rain")
            
        } else if indexPath.row == 1 {
            cell.labelCard.text = "Instrumental"
            cell.imageCard.image = UIImage(named: "piano")
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableViewMusic.cellForRow(at: indexPath) as! CardTableViewCell
        
        //        if indexPath.row == 0 {
        self.performSegue(withIdentifier: "playsSegue", sender: cell.labelCard.text )
        //        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playsSegue" {
            
            let x = segue.destination as! ListagemMusica
            
            if let title = sender as? String, title == "Instrumental" {
                x.playlists = [ "Lo Fi" ,"Piano", "Violão", "Violino", "Harpa", "Classico", "Flauta" , "Synthwave", "Vaporwave","New Era"]
                x.title = title
            }
        }
    }
    
    
}


