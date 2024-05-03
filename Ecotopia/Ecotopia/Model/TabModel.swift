//
//  TabModel.swift
//  Ecotopia
//
//  Created by Carolina Nicole González Leal on 23/04/24.
//

import SwiftUI

struct TabModel: Identifiable {
    private(set) var id: Tab
    var size: CGSize = .zero
    var minX: CGFloat = .zero
    
    enum Tab: String, CaseIterable {
        case Ciudad = "Mi Ciudad"
        case Parques = "Mis Parques"
        case Rios = "Mis Ríos"
        
        case Dashboard = "Dashboard"
        case Metas = "Metas"
        case Comunidad = "Comunidad"
    }
}
