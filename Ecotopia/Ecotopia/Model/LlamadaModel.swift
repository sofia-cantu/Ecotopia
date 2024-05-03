//
//  LlamadaModel.swift
//  Ecotopia-GreenCity
//
//  Created by Sofía Cantú on 23/04/24.
//

import Foundation
import SwiftOpenAI
import AVFoundation

@Observable
final class LlamadaModel: NSObject {
    //var openAI = SwiftOpenAI(apiKey: Bundle.main.getOpenAIApiKey()!)
    
    // Initialize an instance of SwiftOpenAI
    var openAI = SwiftOpenAI(apiKey: "")
     
    // Para el audio
    var avAudioPlayer = AVAudioPlayer()
    var isLoadingTextToSpeechAudio: TextToSpeechType = .noExecuted
    
    /*
    // Variable para almacenar todos los mensajes
    var allMessages: [Message] = []
    */
    
    enum TextToSpeechType {
        case noExecuted
        case isLoading
        case finishedLoading
        case finishedPlaying
    }
    
    func playAudioAgain() {
        avAudioPlayer.play()
    }
    
    @MainActor
    func createSpeech(input: String) async {
        isLoadingTextToSpeechAudio = .isLoading
        do {
            let data = try await openAI.createSpeech(model: .tts(.tts1),
                                                     input: input,
                                                     voice: .alloy,
                                                     responseFormat: .mp3,
                                                     speed: 1.0)

            if let filePath = FileManager.default.urls(for: .documentDirectory,
                                                       in: .userDomainMask).first?.appendingPathComponent("speech.mp3"),
                let data {
                do {
                    try data.write(to: filePath)
                    print("File created: \(filePath)")
                    
                    avAudioPlayer = try AVAudioPlayer(contentsOf: filePath)
                    avAudioPlayer.delegate = self
                    avAudioPlayer.play()
                    isLoadingTextToSpeechAudio = .finishedLoading
                } catch {
                    print("Error saving file: ", error.localizedDescription)
                }
            } else {
                print("Error trying to save file in filePath")
            }
            
        } catch {
            print("Error creating Audios: ", error.localizedDescription)
        }
    }
}

extension LlamadaModel: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        isLoadingTextToSpeechAudio = .finishedPlaying
    }
}
