//
//  CiudadView.swift
//  Ecotopia
//
//  Created by Carolina Nicole González Leal on 23/04/24.
//

import SwiftUI
import AVFoundation

struct FullView: View {
    
    @State private var currentImage = "Recurso 1Vicepresidente"
    @State private var animationCount = 0
    
    @State private var player: AVAudioPlayer?
    
    @State private var currentDate = Date.now
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    let targetHour = 14
    let targetMinute = 50
    
    var body: some View {
        NavigationStack {
            ZStack {
                Home()
                
                HStack {
                    Image(currentImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 200)
                        .position(x: 80, y: 95)

                    NavigationLink(destination: LlamadaView(llamadaModel: .init(), convModel: .constant(.init())), label: {
                        Image(systemName: "phone.circle")
                            .symbolEffect(
                                .bounce.up.byLayer,
                                value: animationCount
                            )
                            .foregroundStyle(Color.green)
                            .font(.system(size: 60))
                    })
                    .padding(.top, 100)
                }
                .padding(.top, 520)
                
            }
        }
        .onReceive(timer) { _ in
            let now = Date.now
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: now)
            let minute = calendar.component(.minute, from: now)
            
            if hour == targetHour && minute == targetMinute {
                if animationCount < 10 {
                    animationCount += 1
                    playSound()
                    currentImage = "Recurso 3Vicepresidente"
                }
            }
        }
        .onAppear {
            currentImage = "Recurso 1Vicepresidente"
        }
    }
    
    func playSound() {
        guard let path = Bundle.main.path(forResource: "ring", ofType: "mp3") else {
            print("Ringtone file not found")
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            player?.play()
        } catch {
            print("Could not load file")
        }
    }
}

#Preview {
    FullView()
}

