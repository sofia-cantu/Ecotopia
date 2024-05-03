//
//  MicModel.swift
//  Ecotopia
//
//  Created by Sofía Cantú on 24/04/24.
//

import SwiftUI
import AVFoundation

extension Notification.Name {
    static let audioDataReady = Notification.Name("audioDataReady")
}


class MicModel: NSObject, ObservableObject, AVAudioRecorderDelegate {
    var audioRecorder: AVAudioRecorder?
    var audioData = Data()

    func startRecording() {
        let recordingSession = AVAudioSession.sharedInstance()
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
        } catch {
            print("Failed to set up recording session")
        }

        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let audioFilename = documentPath.appendingPathComponent("\(UUID().uuidString).m4a")

        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]

        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder?.delegate = self
            audioRecorder?.record()
        } catch {
            print("Could not start recording")
        }
    }



    func stopRecording() {
        audioRecorder?.stop()
        if let data = try? Data(contentsOf: audioRecorder!.url) {
            DispatchQueue.main.async {
                self.audioData = data
                // Publicar la notificación con los datos codificados en Base64
                NotificationCenter.default.post(name: .audioDataReady, object: self.audioData.base64EncodedString())
            }
        }
    }


    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            stopRecording()
        }
    }
}
