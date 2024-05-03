//
//  LogInView.swift
//  Ecotopia
//
//  Created by Carolina Nicole González Leal on 24/04/24.
//

import SwiftUI

struct LogInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                    .frame(height: 20)
                Image("Group 16")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                
                Spacer()
                    .frame(height: 150)
                Text("Iniciar Sesión")
                    .foregroundStyle(Color(red: 145/255, green: 189/255, blue: 53/255))
                    .bold()
                    .font(.title)
                Spacer()
                    .frame(height: 100)
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color(red: 237/255, green: 246/255, blue: 202/255))
                        .frame(width: 300, height: 250)
                    
                    VStack {
                        Spacer()
                        
                        VStack {
                            Text("Email")
                                .foregroundStyle(Color(red: 145/255, green: 189/255, blue: 53/255))
                                .bold()
                                .font(.callout)
                                .padding(.trailing, 200)
                            
                            TextField(
                                "",
                                text: $email,
                                axis: .vertical
                            )
                            .background(Color.white)
                            .cornerRadius(8)
                        }
                        
                        Spacer()
                        
                        VStack {
                            Text("Contraseña")
                                .foregroundStyle(Color(red: 145/255, green: 189/255, blue: 53/255))
                                .bold()
                                .font(.callout)
                                .padding(.trailing, 160)
                            
                            SecureField(text: $password) {
                                Text("")
                            }
                            .background(Color.white)
                            .cornerRadius(8)
                        }
                        
                        Spacer()
                    }
                    .padding()
                    

                }
                .frame(width: 250, height: 150)

                    NavigationLink(destination: QuestionsView(), label: {
                        ZStack {
                            Capsule()
                                .fill(Color(red: 145/255, green: 189/255, blue: 53/255))
                                .frame(width: 150, height: 50)
                            
                            Text("Entra")
                                .foregroundStyle(Color.white)
                                .bold()
                                .font(.headline)
                        }
                    })

                    .padding()

                Spacer()

            }
        }
        .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    LogInView()
}
