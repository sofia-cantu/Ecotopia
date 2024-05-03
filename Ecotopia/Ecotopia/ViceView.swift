//
//  ViceView.swift
//  Ecotopia
//
//  Created by Carolina Nicole González Leal on 23/04/24.
//

import SwiftUI

struct ViceView: View {
    @State var counter = 0
    @Binding var maxCounter: Int
    @Binding var texts: [String]
    @Binding var images: [String]
    @Binding var hasText: Bool
    @Binding var xpos: Int
    @Binding var ypos: Int
    @Binding var widthFrame: Int
    @Binding var heightFrame: Int
    @Binding var colorBubble: Color
    
    
    var body: some View {
        NavigationStack {
            HStack {
                VStack {
                    ZStack {
                        SpeechBubble(cornerRadius: 20, isBottom: true, pointLocation: 50)
                            .fill(colorBubble)
                        Text(texts[counter])
                            .font(.system(size: 20)).bold()
                            .foregroundStyle(.black)
                            .padding()
                    }
                    .frame(width: CGFloat(widthFrame), height: CGFloat(heightFrame))
                    .position(x: CGFloat(xpos), y: CGFloat(ypos))
                    .opacity(hasText == true ? 1 : 0)
                    
                    Image(images[counter])
                        .resizable()
                        .scaledToFit()
                }
                
                Button(action: {
                    if counter < maxCounter {
                        counter += 1
                    }
                    else {
                        return
                    }
                }, label: {
                    Text("Continuar")
                        .foregroundStyle(.gray)
                })
                .opacity(counter < maxCounter ? 1 : 0)
                .padding()

            }
        }
        .navigationBarBackButtonHidden(true)

    }
}

struct SpeechBubble : Shape {
    let cornerRadius : CGFloat
    let isBottom : Bool
    let pointLocation : CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX+cornerRadius, y: rect.minY))
        
        //Top left corner
        path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y:rect.minY+cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: -180), clockwise: true)
        
        if(!isBottom){
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY-10))
            path.addLine(to: CGPoint(x: rect.minX-10, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY+10))
        }
        
        //Left side of bubble
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY-cornerRadius))
        
        //Bottom Left Corner
        path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y:rect.maxY-cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 90), clockwise: true)
        
        if (isBottom){
            path.addLine(to: CGPoint(x: pointLocation-10, y: rect.maxY))
            path.addLine(to: CGPoint(x: pointLocation, y: rect.maxY+10))
            path.addLine(to: CGPoint(x: pointLocation+10, y: rect.maxY))
        }
        
        //Bottom right corner
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y:rect.maxY-cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 0), clockwise: true)
        
        //Right Side of bubble
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY+cornerRadius))
        
        //Top Right Corner
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y:rect.minY+cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: -90), clockwise: true)
        return path
    }
}


#Preview {
    ViceView(maxCounter: .constant(2), texts: .constant(["Hola", "Hola", "Hola"]), images: .constant(["Recurso 1Vicepresidente", "Recurso 1Vicepresidente", "Recurso 1Vicepresidente"]), hasText: .constant(true), xpos: .constant(260), ypos: .constant(300), widthFrame: .constant(300), heightFrame: .constant(150), colorBubble: .constant(Color.blue))
}
