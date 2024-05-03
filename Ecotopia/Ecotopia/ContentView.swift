//
//  ContentView.swift
//  Ecotopia
//
//  Created by Carolina Nicole González Leal on 23/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            TabView {
                Home()
                    .tabItem {
                        Label("Mi ciudad", systemImage: "building.fill")
                    }
                
                PerfilView()
                    .tabItem {
                        Label("Perfil", systemImage: "person.crop.circle.fill")
                    }
                
                Home2()
                    .tabItem {
                        Label("Datos", systemImage: "chart.bar.xaxis")
                    }
            }
            .onAppear() {
                UITabBar.appearance().backgroundColor = .white
            }
            .tint(Color(red: 254/255, green: 109/255, blue: 54/255))
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
