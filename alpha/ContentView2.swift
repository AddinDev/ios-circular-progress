//
//  ContentView2.swift
//  alpha
//
//  Created by addjn on 08/11/20.
//

import SwiftUI

struct ContentView2: View {
    @State var percentage: CGFloat = 0
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                ZStack {
                    Pulse()
                    Track()
                    Label(percentage: self.$percentage)
                    Outline(percentage: self.$percentage)
                }
                Spacer()
                Button("add") {
                    if self.percentage == 100 {
                        
                    } else {
                        self.percentage = self.percentage + 10
                    }
                }
                Spacer()
            }
        }
        .onAppear {
            self.percentage = self.percentage + 50
        }
    }
}

struct Label: View {
    @Binding var percentage: CGFloat
    var body: some View {
        ZStack {
            Text(String(format: "%.0f", percentage))
                .font(.system(size: 65))
                .fontWeight(.heavy).colorInvert()
        }
    }
}

struct Outline: View {
    @Binding var percentage: CGFloat
    var colors = [Color.green]
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.clear)
                .frame(width: 250, height: 250)
                .overlay(
                    Circle()
                        .trim(from: 0, to: percentage * 0.01)
                        .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                        .fill(AngularGradient(gradient: .init(colors: colors), center: .center, startAngle: .zero, endAngle: .init(degrees: 360)))
                        .rotationEffect(.init(degrees: 90))
                ).animation(.spring(response: 2.0, dampingFraction: 1.0, blendDuration: 1.0))
        }
    }
}

struct Track: View {
    var colors = [Color.gray]
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.black)
                .frame(width: 250, height: 250)
                .overlay(
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                        .fill(AngularGradient(gradient: .init(colors: colors), center: .center))
                )
        }
    }
}

struct Pulse: View {
    @State private var pulsate = false
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.blue.opacity(0.5))
                .frame(width: 250, height: 250)
                .scaleEffect(pulsate ? 1.3 : 1.1)
                .animation(Animation.easeInOut(duration: 1.1).repeatForever(autoreverses: true))
                .onAppear{ self.pulsate = true }
        }
    }
    
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
