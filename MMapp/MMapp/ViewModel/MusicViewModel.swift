//
//  MusicViewModel.swift
//  MMapp
//
//  Created by Shanay Save on 2021-12-01.
//

import Foundation
import MediaPlayer

class MusicViewModel {
    
    private var index = -1
    private var queue = [MPMediaItem]()
    private var audioPlayer = AVAudioPlayer()
    
    var isPlaying: Bool { return audioPlayer.isPlaying }
    var isQueueEmpty: Bool { return queue.isEmpty }
    var currentTitle: String {
        guard index >= 0 && index < queue.count else { return "Unknown" }
        return queue[index].title ?? "Unknown"
    }
    
    var currentImage: UIImage? {
        guard index >= 0 && index < queue.count else { return nil }
        guard let size = queue[index].artwork?.bounds.size else { return nil }
        return queue[index].artwork?.image(at: size)
    }
    
    func setQueue (_ songs: [MPMediaItem]) {
        queue = songs
        index = -1
    }

    func handlePlayPause() {
        guard index != -1 else {
            getNextSong()
            audioPlayer.play()
            return
        }
        
        if (isPlaying){
            audioPlayer.pause()
        }
        else {
            audioPlayer.play()
        }
    }
    
    func printCurrentQueue() {
        for song in queue { print (song.title) }
        print (queue.count)
    }
    
    func getNextSong() {
        index += 1
        
        let song = queue[index]
        let url = song.value(forProperty: MPMediaItemPropertyAssetURL) as! URL
        do {audioPlayer =  try AVAudioPlayer(contentsOf: url)} catch { }
    }
    
    func getPrevSong() {
        guard index > 0 else {return}
        index -= 1
        let song = queue[index]
        let url = song.value(forProperty: MPMediaItemPropertyAssetURL) as! URL
        do {audioPlayer =  try AVAudioPlayer(contentsOf: url)} catch { }
    }
    
    func playSongFromBeginning() {
        audioPlayer.currentTime = 0
    }
    
    func playSong() {
        audioPlayer.play()
    }
    func pauseSong(){
        audioPlayer.pause()
    }
    func skipSong(){
        let wasPlaying = audioPlayer.isPlaying
        
        audioPlayer.pause()
        getNextSong()
        
        if wasPlaying {
            audioPlayer.play()
        }
    
    }
    func prevSong(){
        let wasPlaying = audioPlayer.isPlaying
        let time = audioPlayer.currentTime
        
        audioPlayer.pause()
        
        guard time <= 5 else {
            playSongFromBeginning()
            audioPlayer.play()
            return
        }

        getPrevSong()
        
        if wasPlaying {
            audioPlayer.play()
        }
    }
}
