//
//  MiDashboard.swift
//  Ecotopia
//
//  Created by Sofía Cantú on 24/04/24.
//

import SwiftUI

struct MiDashboard: View {
    var body: some View {
        ScrollView {
            VStack {
                
                // Carbon footprint section
                    VStack(alignment: .leading) {
                        Text("Mi huella de carbono")
                            .font(.system(size: 25))
                            .foregroundColor(Color(red: 254/255, green: 109/255, blue: 54/255))
                            .bold()
                            .font(.title)
                        Text("Da seguimiento a tu impacto en el ambiente")
                            .font(.system(size: 13))
                            .padding(.bottom, 30)
                    
 
                    Button(action: {
                        // Action when button is tapped
                    }) {
                        HStack{
                            VStack (alignment: .leading) {
                                Text("Tu huella de carbono")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)

                                Text("Aprende más >")
                                    .font(.system(size: 8))
                                    .underline()

                                    Text("18 Ton CO2E")
                                        .font(.system(size: 24))
                                        .fontWeight(.bold)
                                        .padding(.top, 1)
                            }
                            .padding(15)
                            Spacer()
                            
                            Image("image 36")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100)
                                .padding(.horizontal)
                            
                        }
                        .frame(width: 330)
                            .padding(5)
                            .foregroundColor(Color(red: 137/255, green: 165/255, blue: 24/255))
                            .background(Color(red: 237/255, green: 246/255, blue: 202/255))
                            .cornerRadius(30)
                    }
                    .padding(.vertical, 7)

                    
                    HStack{
                        Button(action: {
                            // Action when button is tapped
                        }) {
                            VStack{
                                ZStack {
                                    Circle()
                                        .trim(from: 0, to: 0.80)
                                        .stroke(Color(red: 220/255, green: 90/255, blue: 40/255), lineWidth: 11)
                                        .frame(width: 90, height: 100)
    
                                    Image(systemName: "car.fill")
                                        .font(.system(size: 38))
                                        .foregroundColor(Color(red: 253/255, green: 169/255, blue: 137/255))
                                }
                                Text("6 tons CO2e")
                            }
                            .padding(15)
                            .frame(width: 150, height: 150)
                            .padding(5)
                            .foregroundColor(Color(red: 220/255, green: 90/255, blue: 40/255))
                            .background(Color(red: 255/255, green: 229/255, blue: 218/255))
                            .cornerRadius(30)
                        }
                        .padding(.vertical, 7)
                        
                        Spacer()
                        
                        Button(action: {
                            // Action when button is tapped
                        }) {
                            HStack{
                                Image(systemName: "carrot")
                                    .font(.system(size: 55))
                                    .padding(.leading, 4)
                                    
                                Spacer()
                                VStack(alignment: .trailing){
                                    Spacer()
                                    Text("12")
                                        .font(.system(size: 24))
                                        .fontWeight(.bold)
                                    Text("tons CO2e")
                                        .font(.system(size: 12))
                                }
                                .padding(15)
                            }
                            .frame(width: 150, height: 150)
                            .padding(5)
                            .foregroundColor(Color(red: 56/255, green: 92/255, blue: 134/255))
                            .background(Color(red: 206/255, green: 242/255, blue: 250/255))
                            .cornerRadius(30)
                        }
                        .padding(.vertical, 7)
                    }
                    .frame(width: 339)
                    
                    
                    
                    Button(action: {
                        // Action when button is tapped
                    }) {
                        HStack{
                            VStack (alignment: .center) {
                                Text("Si todos vivieramos como tú, necesitariamos:")
                                    .font(.system(size: 12))

                                Text("3 planetas Tierra")
                                    .font(.system(size: 24))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(red: 137/255, green: 165/255, blue: 24/255))
                                HStack {
                                    ForEach(0..<3) { _ in
                                        Image(systemName: "globe.americas.fill")
                                    }
                                    .font(.system(size: 70))
                                    
                                }
                            }
                            .padding(15)
                        }
                        .frame(width: 330)
                            .padding(5)
                            .foregroundColor(Color(red: 147/255, green: 175/255, blue: 29/255))
                            .background(Color(red: 237/255, green: 246/255, blue: 202/255))
                            .cornerRadius(30)
                    }
                    .padding(.vertical, 7)
                    
                    
                    Button(action: {
                        // Action when button is tapped
                    }) {
                        HStack{
                            VStack (alignment: .leading) {
                                Text("Hábito tuyo que más contamina:")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)

                                Text("Ir al trabajo solo y en carro propio")
                                    .font(.system(size: 19))
                                    .fontWeight(.bold)
                            }
                            .padding(10)
                      
                        }
                        .frame(width: 330)
                            .padding(5)
                            .foregroundColor(Color(red: 219/255, green: 169/255, blue: 21/255))
                            .background(Color(red: 255/255, green: 246/255, blue: 199/255))
                            .cornerRadius(30)
                    }
                    .padding(.vertical, 7)
                    
                    Button(action: {
                        // Action when button is tapped
                    }) {
                        HStack{
                            VStack (alignment: .leading) {
                                Text("Hábito más sostenible tuyo:")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)

                                Text("No comer carne")
                                    .font(.system(size: 19))
                                    .fontWeight(.bold)
                            }
                            .padding(10)
                            .padding(.horizontal, 7)
                            Spacer()
                            
                            
                        }
                        .frame(width: 330)
                        .padding(5)
                        .foregroundColor(Color(red: 137/255, green: 165/255, blue: 24/255))
                        .background(Color(red: 237/255, green: 246/255, blue: 202/255))
                        .cornerRadius(30)
                        
                    }
                    .padding(.vertical, 7)
                    
                }
                .padding()
                
                // Projects to compensate carbon footprint
                VStack(alignment: .center) {
                    Text("Compensa tu huella de carbono a través de proyectos")
                        .font(.system(size: 30))
                        .padding(.horizontal, 40)
                        .padding(.bottom, 5)
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        // Action when button is tapped
                    }) {
                        Image("proyecto")
                            .resizable()
                            .scaledToFit()
                            .padding(10)
                            .padding(.vertical, 5)
                            .padding(.top, 8)
                    }
                    .frame(width: 330)
                    .padding(5)
                    .foregroundColor(Color(red: 137/255, green: 165/255, blue: 24/255))
                    .background(Color(red: 172/255, green: 192/255, blue: 216/255))
                    .cornerRadius(30)
                    
                    .padding()
                    
                    HStack{
                        ForEach(0..<3) { _ in
                            Image(systemName: "circle.fill")
                        }
                        .font(.system(size: 5))
                    }
                }
            }
        }
    }
}

#Preview {
    MiDashboard()
}
