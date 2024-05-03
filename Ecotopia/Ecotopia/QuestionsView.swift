//
//  Questions1View.swift
//  Ecotopia
//
//  Created by Carolina Nicole González Leal on 24/04/24.
//

import SwiftUI

class FormularioModel: ObservableObject {
    @Published var medioDeTransporteSeleccionado: String = ""
    @Published var frecuenciaDeCarpool: String = ""
    @Published var frecuenciaConsumoProductosAnimales: Double = 0.0
    @Published var porcentajeEnergiasLimpias: Double = 0.0
}

struct QuestionsView: View {
    @StateObject var modelo = FormularioModel()
    
    var body: some View {
        NavigationStack {
            
            TabView {
                Pregunta1View()
                    .tabItem {
                        Image(systemName: "1.circle")
                    }
                
                Pregunta2View()
                    .tabItem {
                        Image(systemName: "2.circle")
                    }
                
                Pregunta3View()
                    .tabItem {
                        Image(systemName: "3.circle")
                    }
                
                Pregunta4View()
                    .tabItem {
                        Image(systemName: "4.circle")
                    }
                
                Pregunta5View()
                    .tabItem {
                        Image(systemName: "5.circle")
                    }
                
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    QuestionsView()
}
