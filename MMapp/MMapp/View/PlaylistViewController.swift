//
//  PlaylistViewController.swift
//  MMapp
//
//  Created by Shanay Save on 2021-11-30.
//

import UIKit
import MediaPlayer

class PlaylistViewController: UITableViewController {
    
    let viewModel: PlaylistViewModel
    
    let playlistNames: [String]
    
    var returnedSongs: (([MPMediaItem]) -> Void)?    //closure (a function and a property)

    init() {
        viewModel = PlaylistViewModel(deviceMediaService: DeviceMediaService())
        playlistNames = viewModel.getAllPlaylistNames()
        super.init(style: .insetGrouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Playlists"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PlaylistCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlistNames.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistCell", for: indexPath)
        cell.textLabel?.text = playlistNames[indexPath.row]
        return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            if let returnedSongs = self.returnedSongs {        //checks to see if it has been instantiated in musicviewcontroller
                returnedSongs(self.viewModel.getAllSongsInAPlaylist(self.playlistNames[indexPath.row]))
            }
        }
    }
}
