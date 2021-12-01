//
//  PlaylistViewModel.swift
//  MMapp
//
//  Created by Shanay Save on 2021-11-30.
//

import Foundation

class PlaylistViewModel{
    
    private let deviceMediaService: DeviceMediaService   //Dependency Injection
    
    init (deviceMediaService: DeviceMediaService) {
        self.deviceMediaService = deviceMediaService
    }
    
    func getAllPlaylistNames() -> [String] {
        return deviceMediaService.getAllPlaylistNames()
    }
    
}
