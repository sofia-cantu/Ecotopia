//
//  PerfilView.swift
//  Ecotopia
//
//  Created by Carolina Nicole González Leal on 23/04/24.
//

import SwiftUI

struct PerfilView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color(red: 240/255, green: 249/255, blue: 204/255)
                    .ignoresSafeArea()
                    .cornerRadius(30)
                
                VStack {
                    HeaderView()
                        .background(Color.white)
                    Spacer()
                    
                    HStack {
                        Text("20")
                            .font(.system(size: 50))
                            .bold()
                            .foregroundStyle(Color(red: 31/255, green: 176/255, blue: 211/255))
                        
                        
                        Text("días registrados")
                            .font(.callout)
                            .padding(.top)
                        
                        Spacer()
                        
                        Image(systemName: "gear")
                            .font(.system(size: 40))
                            .foregroundStyle(Color(red: 56/255, green: 92/255, blue: 134/255))
                        
                        
                    }
                    .padding(.horizontal)
                    
                    VStack {
                        Image("image 37")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                            .frame(alignment: .center)
                            .padding(.bottom, -15)
                            .padding(.leading, 50)
                        
                        ZStack {
                            Rectangle()
                                .fill(Color(red: 163/255, green: 201/255, blue: 81/255))
                                .frame(height: 250)
                                .clipShape(
                                    .rect(
                                        topLeadingRadius: 30,
                                        bottomLeadingRadius: 0,
                                        bottomTrailingRadius: 0,
                                        topTrailingRadius: 30
                                    )
                                )
                            VStack {
                                Text("Mauricio Ochoa")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 40))
                                    .bold()
                                
                                Text("@mau.2001")
                                    .foregroundStyle(.white)
                                
                                HStack {
                                    Spacer()
                                    Text("Se unió en abril 2024")
                                        .foregroundStyle(.white)
                                        .frame(width: 90)
 
                                    Text("|")
                                        .foregroundStyle(.white)
                                        .font(.title)
  
                                    Image("Mexico")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(.white)
                                    Spacer()
                                }
                                
                                NavigationLink(destination: QuestionsView(), label: {
                                    ZStack {
                                        Capsule()
                                            .frame(width: 200, height: 40)
                                        
                                        HStack {
                                            Text("Formulario Inicial")
                                                .foregroundStyle(.white)
                                            
                                            Image(systemName: "arrow.left.arrow.right")
                                                .foregroundStyle(.white)
                                        }
                                    }
                                        
                                })
                                
                            }
                            
                        }
                    }
                    
                }
            }
        }
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        HStack {
            Image("Group 12")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
            
            Spacer(minLength: 0)
            
            Button("", systemImage: "bell.fill") {
                
            }
            .font(.title2)
            .tint(.primary)
            
            
        }
        .padding(15)
    }
    
}

#Preview {
    ContentView()
}
