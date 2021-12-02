//
//  PlaylistViewModel.swift
//  MMapp
//
//  Created by Shanay Save on 2021-11-30.
//

import Foundation
import MediaPlayer

class PlaylistViewModel{

    
    private let deviceMediaService: DeviceMediaService   //Dependency Injection
    
    init (deviceMediaService: DeviceMediaService) {
        self.deviceMediaService = deviceMediaService
    }
    
    func getAllPlaylistNames() -> [String] {
        return deviceMediaService.getAllPlaylistNames()
    }
    
    func getAllSongsInAPlaylist(_ playlistName: String) -> [MPMediaItem] {
        return deviceMediaService.getAllSongsInAPlaylist(playlistName)
    }
    
}
