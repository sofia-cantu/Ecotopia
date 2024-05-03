//
//  MiParque.swift
//  Ecotopia
//
//  Created by Carolina Nicole González Leal on 24/04/24.
//

import SwiftUI
import AVFoundation

struct MiParque: View {
    
    let imagesCity: [String] = ["Recurso 22LogoChico 1", "Recurso 23LogoChico 1"]
    let imagesVice: [String] = ["Recurso 4Vicepresidente", "Recurso 10Vicepresidente"]
    let texts: [String] = ["¡Presidente! La situación de sus parques es un poco preocupante, encárguese de recoger y reciclar su basura cuanto antes.", "¡El parque está destruído! Su consumo excesivo de CO2 ha aumentado la temperatura y quemado los árboles."]
    
    @State private var counter = 0
    
    @State private var currentImage = "Recurso 1Vicepresidente"
    @State private var animationCount = 0
    
    @State private var player: AVAudioPlayer?
    
    @State private var currentDate = Date.now
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    let targetHour = 17
    let targetMinute = 41
    
    
    var body: some View {
        ZStack {
            
            Color(red: 206/255, green: 242/255, blue: 250/255)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                    .frame(height: 10)
                Image(imagesCity[counter])
                    .resizable()
                    .scaledToFill()
                    .onTapGesture {
                        incrementCounter()
                        currentImage = imagesVice[counter]
                    }
             
                HStack {
                    Image(currentImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .position(x: 115, y: -5)

                    NavigationLink(destination: LlamadaView(llamadaModel: .init(), convModel: .constant(.init())), label: {
                        Image(systemName: "phone.circle")
                            .symbolEffect(
                                .bounce.up.byLayer,
                                value: animationCount
                            )
                            .foregroundStyle(Color.green)
                            .font(.system(size: 60))
                    })
                    .position(x: 120, y: 10)
                }
                .padding(.top, 70)
                
            }
            
            Rectangle()
                .fill(Color(red: 83/255, green: 207/255, blue: 238/255))
                .frame(width: 350, height: 120)
                .cornerRadius(40)
                .position(x: 200, y: 500)
            
            Text(texts[counter])
                .frame(width: 340, height: 120)
                .font(.callout)
                .multilineTextAlignment(.center)
                .position(x: 200, y: 500)
            
        }
        .onReceive(timer) { _ in
            let now = Date.now
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: now)
            let minute = calendar.component(.minute, from: now)
            
            if hour == targetHour && minute == targetMinute {
                if animationCount < 5 {
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
    
    private func incrementCounter() {
        counter = (counter + 1) % imagesCity.count
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
    ContentView()
}
