//
//  Pregunta1View.swift
//  Ecotopia
//
//  Created by Carolina Nicole González Leal on 24/04/24.
//

import SwiftUI

struct Pregunta1View: View {
    @StateObject var modelo = FormularioModel()
    var body: some View {
        VStack {
            Text("¿Qué medio de transporte usas con mayor frecuencia?")
                .multilineTextAlignment(.center)
                .foregroundStyle(Color(red: 254/255, green: 109/255, blue: 54/255))
                .font(.title)
                .bold()
                .padding(.horizontal, 35)
            
            Button(action: {
                modelo.medioDeTransporteSeleccionado = "Automóvil"
                //
            }, label: {
                SquareChoice(color: modelo.medioDeTransporteSeleccionado == "Automóvil" ? Color(red: 254/255, green: 109/255, blue: 54/255) : Color(red: 255/255, green: 229/255, blue: 218/255), image: "passenger car front view", title: "Automóvil", textColor: Color(red: 254/255, green: 109/255, blue: 54/255))
                    
            })
            .border(modelo.medioDeTransporteSeleccionado == "Automóvil" ? Color.black : Color.clear, width: 2)

            
            Button(action: {
                modelo.medioDeTransporteSeleccionado = "Bicicleta"
            }, label: {
                SquareChoice(color: Color(red: 255/255, green: 246/255, blue: 199/255), image: "bicycle", title: "Bicicleta", textColor: Color(red: 219/255, green: 169/255, blue: 21/255))
            })
            .border(modelo.medioDeTransporteSeleccionado == "Bicicleta" ? Color.black : Color.clear, width: 2)
            
            Button(action: {
                modelo.medioDeTransporteSeleccionado = "Transporte público"
            }, label: {
                SquareChoice(color: Color(red: 206/255, green: 242/255, blue: 250/255), image: "school bus", title: "Transporte público", textColor: Color(red: 19/255, green: 145/255, blue: 176/255))
            })
            .border(modelo.medioDeTransporteSeleccionado == "Transporte público" ? Color.black : Color.clear, width: 2)
            
            Spacer()
                .frame(height: 40)
        }
    }
}

struct Pregunta2View: View {
    @StateObject var modelo = FormularioModel()
    var body: some View {
        VStack {
            Text("Cuando viajas por carro, ¿cada cuánto haces carpool?")
                .multilineTextAlignment(.center)
                .foregroundStyle(Color(red: 254/255, green: 109/255, blue: 54/255))
                .font(.title)
                .bold()
                .padding(.horizontal, 35)
            
            Button(action: {
                modelo.frecuenciaDeCarpool = "Siempre"
            }, label: {
                SquareChoice(color: Color(red: 255/255, green: 229/255, blue: 218/255), image: "Siempre", title: "Siempre", textColor: Color(red: 254/255, green: 109/255, blue: 54/255))
            })
            .border(modelo.frecuenciaDeCarpool == "Siempre" ? Color.black : Color.clear, width: 2)
            
            Button(action: {
                modelo.frecuenciaDeCarpool = "A veces"
            }, label: {
                SquareChoice(color: Color(red: 255/255, green: 246/255, blue: 199/255), image: "A veces", title: "A veces", textColor: Color(red: 219/255, green: 169/255, blue: 21/255))
            })
            .border(modelo.frecuenciaDeCarpool == "A veces" ? Color.black : Color.clear, width: 2)
            
            Button(action: {
                modelo.frecuenciaDeCarpool = "Nunca"
            }, label: {
                SquareChoice(color: Color(red: 206/255, green: 242/255, blue: 250/255), image: "Nunca", title: "Nunca", textColor: Color(red: 19/255, green: 145/255, blue: 176/255))
            })
            .border(modelo.frecuenciaDeCarpool == "Nunca" ? Color.black : Color.clear, width: 2)
            
            Spacer()
                .frame(height: 40)
            
        }
    }
}

struct Pregunta3View: View {
    
    @StateObject var modelo = FormularioModel()
    
    @State var maxHeight: CGFloat = UIScreen.main.bounds.height / 2.5
    @State var sliderProgress: CGFloat = 0
    @State var sliderHeight: CGFloat = 0
    @State var lastDragValue: CGFloat = 0
    
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 20)
            
            Text("¿Qué tan frecuente consumes productos de origen animal?")
                .foregroundStyle(Color(red: 219/255, green: 169/255, blue: 21/255))
                .font(.title)
                .bold()
                .padding(.horizontal, 45)
                .multilineTextAlignment(.center)
            
            Text("(carne, cerdo, pescado, pollo, huevos, etc)")
                .font(.caption)
                .padding(.bottom, 40)
            
            HStack {
                Image("Chicken leg")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .position(x: 210, y: 70)
                
                ZStack(alignment: .bottom, content: {
                    
                    Rectangle()
                        .fill(Color.gray)
                    
                    Rectangle()
                        .fill(Color(red: 254/255, green: 216/255, blue: 54/255))
                        .frame(height: sliderHeight)
                    
                })
                .frame(width: 80, height: maxHeight)
                .cornerRadius(35)
                .overlay (
                    Text("\(Int(sliderProgress * 100))%")
                        .fontWeight(.semibold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 18)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.vertical, 30)
                        .offset(y: sliderHeight < maxHeight - 105 ? -sliderHeight : -maxHeight + 105)
                    
                    ,alignment: .bottom
                    
                )
                .gesture(DragGesture(minimumDistance: 0).onChanged({
                    (value) in
                    
                    let translation = value.translation
                    
                    sliderHeight = -translation.height + lastDragValue
                    
                    sliderHeight = sliderHeight > maxHeight ? maxHeight : sliderHeight
                    
                    sliderHeight = sliderHeight >= 0 ? sliderHeight : 0
                    
                    let progress = sliderHeight / maxHeight
                    
                    sliderProgress = progress <= 1.0 ? progress : 1
                    
                    modelo.frecuenciaConsumoProductosAnimales = progress
                    
                }).onEnded({ (value) in
                    
                    sliderHeight = sliderHeight > maxHeight ? maxHeight : sliderHeight
                    
                    sliderHeight = sliderHeight >= 0 ? sliderHeight : 0
                    
                    lastDragValue = sliderHeight
                    
                    
                    
                }))
                Spacer()
                    .frame(height: 100)
            }
        }
    }
}

struct Pregunta4View: View {
    
    @StateObject var modelo = FormularioModel()
    
    @State var maxHeight: CGFloat = UIScreen.main.bounds.height / 2.5
    @State var sliderProgress: CGFloat = 0
    @State var sliderHeight: CGFloat = 0
    @State var lastDragValue: CGFloat = 0
    
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 20)
            Text("¿Qué porcentaje de electricidad en tu hogar es de energías limpias?")
                .foregroundStyle(Color(red: 31/255, green: 176/255, blue: 211/255))
                .font(.title)
                .bold()
                .padding(.horizontal, 35)
                .multilineTextAlignment(.center)
            
            HStack {
                Image("solar panel")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .position(x: 200, y: 90)
                
                ZStack(alignment: .bottom, content: {
                    
                    Rectangle()
                        .fill(Color.gray)
                    
                    Rectangle()
                        .fill(Color(red: 173/255, green: 213/255, blue: 90/255))
                        .frame(height: sliderHeight)
                    
                })
                .frame(width: 80, height: maxHeight)
                .cornerRadius(35)
                .overlay (
                    Text("\(Int(sliderProgress * 100))%")
                        .fontWeight(.semibold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 18)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.vertical, 30)
                        .offset(y: sliderHeight < maxHeight - 105 ? -sliderHeight : -maxHeight + 105)
                    
                    ,alignment: .bottom
                    
                )
                .gesture(DragGesture(minimumDistance: 0).onChanged({
                    (value) in
                    
                    let translation = value.translation
                    
                    sliderHeight = -translation.height + lastDragValue
                    
                    sliderHeight = sliderHeight > maxHeight ? maxHeight : sliderHeight
                    
                    sliderHeight = sliderHeight >= 0 ? sliderHeight : 0
                    
                    let progress = sliderHeight / maxHeight
                    
                    sliderProgress = progress <= 1.0 ? progress : 1
                    
                    modelo.porcentajeEnergiasLimpias = progress
                    
                }).onEnded({ (value) in
                    
                    sliderHeight = sliderHeight > maxHeight ? maxHeight : sliderHeight
                    
                    sliderHeight = sliderHeight >= 0 ? sliderHeight : 0
                    
                    lastDragValue = sliderHeight
                    
                    
                    
                }))
                Spacer()
                    .frame(height: 100)
            }
        }
    }
}

struct Pregunta5View: View {
    var body: some View {
        NavigationStack {
            VStack {
                
                Image("Group 16")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .padding(.bottom, 100)
                NavigationLink(destination: BienvenidaView(), label: {
                    ZStack {
                        Capsule()
                            .fill(Color(red: 145/255, green: 189/255, blue: 53/255))
                            .frame(width: 150, height: 50)
                        
                        Text("Finalizar")
                            .foregroundStyle(Color.white)
                            .bold()
                            .font(.headline)
                    }
                })
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


struct SquareChoice: View {
    @State var color: Color
    @State var image: String
    @State var title: String
    @State var textColor: Color
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(color)
                    .frame(width: 150, height: 150)
                
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
            }
            
            Text(title)
                .foregroundStyle(textColor)
                .bold()
                .font(.callout)
        }
    }
}



#Preview {
    Pregunta1View()
}
