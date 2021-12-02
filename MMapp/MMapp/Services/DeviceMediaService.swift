//
//  DeviceMediaService.swift
//  MMapp
//
//  Created by Shanay Save on 2021-11-30.
//

import Foundation
import MediaPlayer

class DeviceMediaService {
    
    func getAllPlaylistNames() -> [String] {
        guard let collections = MPMediaQuery.playlists().collections else { return [] }
        return collections.map { $0.value(forProperty: MPMediaPlaylistPropertyName) as? String ?? "Unknown" }
    }
    
    func getAllSongsInAPlaylist(_ playlistName: String) -> [MPMediaItem]{
        guard let collections = MPMediaQuery.playlists().collections else {return []}
            for playlist in collections {
                if (playlist.value(forProperty: MPMediaPlaylistPropertyName) as? String ?? "Unknown" == playlistName){return playlist.items}
                
            }
        
        return []
    }
}
