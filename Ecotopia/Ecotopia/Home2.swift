//
//  HOME.swift
//  Ecotopia
//
//  Created by Carolina Nicole González Leal on 23/04/24.
//

import SwiftUI

struct Home2: View {
    
    @State private var tabs: [TabModel] = [
        .init(id: TabModel.Tab.Dashboard),
        .init(id: TabModel.Tab.Metas),
        .init(id: TabModel.Tab.Comunidad)
    ]
    
    @State private var activeTab: TabModel.Tab = .Dashboard
    @State private var mainViewScrollState: TabModel.Tab?
    
    var body: some View {
        ZStack {
            
            VStack {
                HeaderView()
                    .background(Color.white)
                CustomTabBar()
                
                // Main View
                GeometryReader {
                    let size = $0.size
                    
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 0) {
                            ForEach(tabs) { tab in
                                tabView(for: tab.id)
                                    .frame(width: size.width, height: size.height)
                                    .contentShape(.rect)
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollPosition(id: $mainViewScrollState)
                    .scrollIndicators(.hidden)
                    .scrollTargetBehavior(.paging)
                    .onChange(of: mainViewScrollState) { oldValue, newValue in
                        if let newValue {
                            withAnimation(.snappy) {
                                activeTab = newValue
                            }
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func tabView(for tab: TabModel.Tab) -> some View {
        switch tab {
        case .Dashboard:
            MiDashboard()
        case .Metas:
            MisMetas()
        case .Comunidad:
            MiComunidad()
        case .Ciudad:
            MiCiudad()
        case .Parques:
            MiParque()
        case .Rios:
            MiRio()
        }
    }
    
    // Header View
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
    
    
    // Dynamic Scrollable Tab Bar
    
    @ViewBuilder
    func CustomTabBar() -> some View {
        ScrollView(.horizontal) {
            HStack(spacing: 40) {
                ForEach(tabs) { tab in
                    Button(action: {
                        withAnimation(.snappy) {
                            activeTab = tab.id
                            mainViewScrollState = tab.id
                        }
                    }, label: {
                        Text(tab.id.rawValue)
                            .padding(.vertical, 12)
                            .foregroundStyle(activeTab == tab.id ? Color(red: 237/255, green: 246/255, blue: 202/255) : Color(red: 146/255, green: 175/255, blue: 29/255))
                            .bold()
                            .contentShape(.rect)
                            .padding(.horizontal, 5)
                    })
                    .background(activeTab == tab.id ? Color(red: 146/255, green: 175/255, blue: 29/255) : Color(red: 237/255, green: 246/255, blue: 202/255))
                    .cornerRadius(30)
                    

                    
                    .buttonStyle(.plain)
                }
            }
        }
        .safeAreaPadding(.horizontal, 15)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    Home2()
}
