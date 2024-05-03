//
//  BienvenidaView.swift
//  Ecotopia
//
//  Created by Carolina Nicole González Leal on 24/04/24.
//

import SwiftUI

struct BienvenidaView: View {
    @State var maxCounter = 2
    @State var texts: [String] = ["Bienvenido Señor Presidente, lo estábamos esperando...", "Todos los ciudadanos imitan sus prácticas y hábitos, se hace lo que usted imponga...", "Mantenga buenas decisiones, ¡su país y su gente lo necesita!"]
    @State var images: [String] = ["Recurso 1Vicepresidente", "Recurso 1Vicepresidente", "Recurso 2Vicepresidente"]
    @State var hasText = true
    @State var xpos: Int = 260
    @State var ypos: Int = 300
    @State var widthFrame: Int = 300
    @State var heightFrame: Int = 150
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("image 29")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                ViceView(maxCounter: $maxCounter, texts: $texts, images: $images, hasText: $hasText, xpos: $xpos, ypos: $ypos, widthFrame: $widthFrame, heightFrame: $heightFrame, colorBubble: .constant(Color.white))
                    .frame(width:400)
                    .position(x: 140, y: 420)
                
                NavigationLink(destination: ContentView(), label: {
                    ZStack {
                        Capsule()
                            .fill(Color(red: 145/255, green: 189/255, blue: 53/255))
                            .frame(width: 150, height: 50)
                        
                        Text("Comenzar")
                            .foregroundStyle(Color.white)
                            .bold()
                            .font(.headline)
                    }
                })
                .position(x: 300, y: 750)
                
            }
        }
    }
}

#Preview {
    BienvenidaView()
}
