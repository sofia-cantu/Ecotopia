//
//  MisMetas.swift
//  Ecotopia
//
//  Created by Carolina Nicole González Leal on 24/04/24.
//

import SwiftUI

struct MisMetas: View {
    @State private var moreInfo1 = false
    @State private var moreInfo2 = false
    @State private var moreInfo3 = false
    @State private var moreInfo4 = false
    
    var body: some View {
        ZStack {
            Color(red: 240/255, green: 249/255, blue: 204/255)
                .ignoresSafeArea()
            
            VStack {
                
                Text("Completa tus metas")
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color(red: 137/255, green: 165/255, blue: 24/255))
                
                HStack {
                    CustomProgressView(percentage: 0.7, progressColor: Color(red: 254/255, green: 216/255, blue: 54/255), icon: "lightbulb")
                    
                    Button {
                        moreInfo1 = true
                    } label: {
                        Image(systemName: moreInfo1 == true ? "chevron.down" : "chevron.right")
                            .padding(.trailing, 15)
                            .bold()
                            .foregroundStyle(Color(red: 146/255, green: 175/255, blue: 29/255))
                    }
                    .popover(isPresented: $moreInfo1) {
                        VStack {
                            Text("Energía")
                                .bold()
                                .font(.title2)
                            Text("¡Te faltan cambiar 3 focos más para alcanzar tu meta de energías renovables!")
                                .font(.headline)
                                .padding()
                        }
                    }
                }
                
                HStack {
                    
                    CustomProgressView(percentage: 0.4, progressColor: Color(red: 92/255, green: 207/255, blue: 243/255), icon: "car")
                    
                    
                    Button {
                        moreInfo2 = true
                    } label: {
                        Image(systemName: moreInfo2 == true ? "chevron.down" : "chevron.right")
                            .padding(.trailing, 10)
                            .bold()
                            .foregroundStyle(Color(red: 146/255, green: 175/255, blue: 29/255))
                    }
                    .popover(isPresented: $moreInfo2) {
                        VStack {
                            Text("Transporte")
                                .bold()
                                .font(.title2)
                            Text("¡Te faltan 5 viajes en bicicleta al trabajo!")
                                .font(.headline)
                                .padding()
                        }
                    }
                    
                }
                
                HStack {
                    CustomProgressView(percentage: 0.5, progressColor: Color(red: 254/255, green: 109/255, blue: 54/255), icon: "trash")
                    
                    
                    Button {
                        moreInfo3 = true
                    } label: {
                        Image(systemName: moreInfo3 == true ? "chevron.down" : "chevron.right")
                            .padding(.trailing, 10)
                            .bold()
                            .foregroundStyle(Color(red: 146/255, green: 175/255, blue: 29/255))
                    }
                    .popover(isPresented: $moreInfo3) {
                        VStack {
                            Text("Residuos")
                                .bold()
                                .font(.title2)
                            Text("¡Recicla 2 botella hoy!")
                                .font(.headline)
                                .padding()
                        }
                    }
                }
                
                
                HStack {
                    CustomProgressView(percentage: 0.6, progressColor: Color(red: 173/255, green: 213/255, blue: 90/255), icon: "fork.knife")
                    
                    
                    Button {
                        moreInfo4 = true
                    } label: {
                        Image(systemName: moreInfo4 == true ? "chevron.down" : "chevron.right")
                            .padding(.trailing, 10)
                            .bold()
                            .foregroundStyle(Color(red: 146/255, green: 175/255, blue: 29/255))
                    }
                    .popover(isPresented: $moreInfo4) {
                        VStack {
                            Text("Comida")
                                .bold()
                                .font(.title2)
                            Text("¡Tu meta de “vegetariano por un día” sigue en pie!")
                                .font(.headline)
                                .padding()
                        }
                    }
                    
                }
                
                
                NavigationLink(destination: MiDashboard(), label: {
                    ZStack {
                        Capsule()
                            .fill(Color(red: 254/255, green: 109/255, blue: 54/255))
                            .frame(width: 200, height: 40)
                        
                        Text("Mis proyectos")
                            .foregroundStyle(.white)
                    }
                })
                .padding()
                
            }
            
        }
    }
}

struct CustomProgressView: View {
    @State var percentage: CGFloat
    @State var progressColor: Color
    @State var icon: String
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 50) {
                
                Text("\(Int(percentage * 100))%").bold()
                    .frame(height: 5)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background {
                        progressViewWith(cornerRadius: 30)
                    }
            }
            .padding()
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: DispatchWorkItem(block: {
                    percentage = percentage
                }))
            })
            
            ZStack {
                Circle()
                    .fill(progressColor)
                    .frame(width: 50)
                    .padding(.leading, 320)
                
                Image(systemName: icon)
                    .font(.system(size: 30))
                    .foregroundStyle(.white)
                    .frame(width: 50)
                    .padding(.leading, 320)
                    .bold()
            }
            
        }
    }
    
    private func progressViewWith(cornerRadius: CGFloat) -> some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(Color.gray.opacity(0.5), lineWidth: 1.0)
            .padding(1.0)
            .background {
                GeometryReader { geometry in
                    HStack {
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .fill(progressColor)
                            .frame(width: geometry.size.width * percentage)
                            .animation(.bouncy, value: percentage)
                    }
                }
            }
            .clipShape(
                RoundedRectangle(cornerRadius: cornerRadius)
            )
    }
}

#Preview {
    MisMetas()
}
