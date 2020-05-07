//
//  ListagemMusicas.swift
//  Serenity
//
//  Created by Alley Pereira on 5/6/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit


class ListagemMusica: UIViewController {
    
    
    @IBOutlet weak var playlistTableView: UITableView!
    
    var playlists: [String] = ["Correnteza do Rio", "Floresta Tranquila", "Campo com Pássaros", "Ondas do Mar", "Chuva", "Noite Calma", "Tarde no Parque", "Pico da Montanha"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: "PlaylistsTableViewCell", bundle: .main)
        playlistTableView.register(cellNib, forCellReuseIdentifier: PlaylistsTableViewCell.identifier)
        
         playlistTableView.separatorStyle = .none
        
        playlistTableView.delegate = self
        playlistTableView.dataSource = self
        
        self.navigationItem.title = self.title
    }
}


extension ListagemMusica: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = playlistTableView.dequeueReusableCell(withIdentifier: PlaylistsTableViewCell.identifier) as! PlaylistsTableViewCell
        
        cell.musicNameLabel.text = playlists[indexPath.row]
        
        return cell
    }
    
    
}
