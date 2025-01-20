//
//  Audio.swift
//  PokeData
//
//  Created by Garrett Butchko on 12/27/24.
//

import OggDecoder
import AVFoundation
import Foundation

class AudioPlayer {
    var player: AVPlayer?
    
    func downloadOggFile(from url: URL, completion: @escaping (URL?) -> Void) {
        let session = URLSession.shared
        let task = session.downloadTask(with: url) { localURL, response, error in
            guard let localURL = localURL, error == nil else {
                print("Failed to download file: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            completion(localURL)
        }
        task.resume()
    }
    
    func copyToPersistentLocation(_ tempURL: URL) -> URL? {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let destinationURL = documentsDirectory.appendingPathComponent(tempURL.lastPathComponent)
        
        do {
            if FileManager.default.fileExists(atPath: destinationURL.path) {
                try FileManager.default.removeItem(at: destinationURL)
            }
            try FileManager.default.copyItem(at: tempURL, to: destinationURL)
            print("File copied to \(destinationURL.path)")
            return destinationURL
        } catch {
            print("Failed to copy file: \(error.localizedDescription)")
            return nil
        }
    }
    
    func playOggFile(from url: URL) {
        downloadOggFile(from: url) { localOggURL in
            guard let oggURL = localOggURL else {
                print("Failed to download OGG file.")
                return
            }
            
            // Copy to persistent location
            if let persistentURL = self.copyToPersistentLocation(oggURL) {
                let decoder = OGGDecoder()
                decoder.decode(persistentURL) { savedWavURL in
                    guard let wavURL = savedWavURL else {
                        print("Failed to decode the OGG file.")
                        return
                    }
                    self.playWavFile(wavURL)
                }
            } else {
                print("Failed to copy file to persistent location.")
            }
        }
    }

    
    func playWavFile(_ url: URL) {
        let asset = AVURLAsset(url: url)
        let playerItem = AVPlayerItem(asset: asset)
        self.player = AVPlayer(playerItem: playerItem)
        self.player?.play()
    }
}
