//
//  MiComunidad.swift
//  Ecotopia
//
//  Created by Carolina Nicole González Leal on 24/04/24.
//

import SwiftUI

struct MiComunidad: View {
    var body: some View {
        NavigationStack {
            
            VStack {
                
                HStack {
                    Text("Tus amigos")
                        .foregroundStyle(Color(red: 254/255, green: 109/255, blue: 54/255))
                        .bold()
                        .font(.title)
                    Spacer()
                    
                    Image(systemName: "person.crop.circle.badge.plus")
                        .foregroundStyle(Color(red: 254/255, green: 109/255, blue: 54/255))
                        .font(.title)
                }
                .padding()
                
                ScrollView {
                    VStack {
                        FriendProfile(image: "image 30", name: "Emiliano Mtz", co2: "20 Ton CO2e", flag: "56", backgroundColor: Color(red: 255/255, green: 229/255, blue: 218/255), tetxColor: Color(red: 254/255, green: 109/255, blue: 54/255))
                        
                        FriendProfile(image: "image 31", name: "José Pablo", co2: "53 Ton CO2e", flag: "4", backgroundColor: Color(red: 206/255, green: 242/255, blue: 250/255), tetxColor: Color(red: 24/255, green: 141/255, blue: 170/255))
                        
                        FriendProfile(image: "image 32", name: "Ángel Rodríguez", co2: "14 Ton CO2e", flag: "35", backgroundColor: Color(red: 237/255, green: 246/255, blue: 202/255), tetxColor: Color(red: 89/255, green: 110/255, blue: 8/255))
                        
                        FriendProfile(image: "image 33", name: "Sandra López", co2: "11 Ton CO2e", flag: "121", backgroundColor: Color(red: 255/255, green: 246/255, blue: 199/255), tetxColor: Color(red: 219/255, green: 169/255, blue: 21/255))
                    }
                }
            }
        }
    }

}

struct FriendProfile: View {
    
    @State var image: String
    @State var name: String
    @State var co2: String
    @State var flag: String
    @State var backgroundColor: Color
    @State var tetxColor: Color
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(backgroundColor)
                    .frame(width: 350, height: 150)
                
                HStack {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)

                    VStack {
                        Text(name)
                            .foregroundStyle(Color(red: 51/255, green: 54/255, blue: 56/255))
                            .bold()
                            .font(.callout)
                            .padding(.trailing, 10)
                        
                        Text(co2)
                            .foregroundStyle(tetxColor)
                            .bold()
                            .font(.system(size: 30))
                    }
                    
                    VStack {
                        HStack {
                            Text(flag)
                            Image(systemName: "flag.fill")
                        }
                        Spacer()
                        Image(systemName: "hands.clap")
                        
                    }
                    .frame(height: 120)
                    .padding()
                }
                .frame(width: 350, height: 150)

            }
            .padding()
        }
    }
}




#Preview {
    MiComunidad()
}
