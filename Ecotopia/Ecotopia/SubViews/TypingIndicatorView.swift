//
//  TypingIndicatorView.swift
//  Ecotopia
//
//  Created by Sofía Cantú on 24/04/24.
//
import SwiftUI

struct TypingIndicatorView: View {
    @State private var animationCycle = 0
    @State private var timer: Timer?

    let animationDuration: Double = 0.6
    let dotSize: CGFloat = 10
    let color: Color = Color(red: 206/255, green: 242/255, blue: 250/255)

    var body: some View {
        HStack(spacing: dotSize) {
            ForEach(0..<3) { index in
                Circle()
                    .fill(color)
                    .frame(width: dotSize, height: dotSize)
                    .offset(y: animationCycle == index ? -dotSize : 0)
            }
            Text("Reconectando llamada")
                .font(.headline)
                .foregroundColor(color)
        }
        .onAppear {
            animationCycle = 0
            timer = Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: true) { _ in
                withAnimation(.easeInOut(duration: animationDuration)) {
                    animationCycle = (animationCycle + 1) % 3
                }
            }
        }
        .onDisappear {
            timer?.invalidate()
        }
    }
}

#Preview {
    TypingIndicatorView()
}
