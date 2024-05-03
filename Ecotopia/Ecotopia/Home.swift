//
//  HOME.swift
//  Ecotopia
//
//  Created by Carolina Nicole González Leal on 23/04/24.
//

import SwiftUI

struct Home: View {
    
    @State private var tabs: [TabModel] = [
        .init(id: TabModel.Tab.Ciudad),
        .init(id: TabModel.Tab.Parques),
        .init(id: TabModel.Tab.Rios)
    ]
    
    @State private var activeTab: TabModel.Tab = .Ciudad
    @State private var mainViewScrollState: TabModel.Tab?
    
    var body: some View {
        ZStack {
            Color(red: 206/255, green: 242/255, blue: 250/255)
                .ignoresSafeArea()
            
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
                            .foregroundStyle(activeTab == tab.id ? Color.white : Color(red: 59/255, green: 194/255, blue: 227/255))
                            .bold()
                            .contentShape(.rect)
                            .padding(.horizontal, 5)
                    })
                    .background(activeTab == tab.id ? Color(red: 64/255, green: 200/255, blue: 233/255) : .white)
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
    Home()
}
