//
//  ContentView.swift
//  AnimationSwiftUI
//
//  Created by Борис Сонин on 28.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isRotated = false
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .green], startPoint: isRotated ? .topLeading : .bottomLeading, endPoint: isRotated ? .bottomTrailing : .topTrailing)
                .ignoresSafeArea()
                .onAppear { withAnimation((.linear(duration: 2.0).repeatForever(autoreverses: true)))
                    { isRotated.toggle()
                    }
                }
            
            VStack {
                Text("Tap the image")
                    .font(.title)
                    .bold()
                Spacer()
                
                Image(systemName: "sun.max.fill")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.yellow)
                    .rotationEffect(Angle.degrees(isRotated ? 360 : 0))
                    .rotation3DEffect(Angle.degrees(isRotated ? 180 : 0), axis: (x: 1, y: 0, z: 0))
                    .animation(.easeInOut(duration: 3), value: isRotated)
                Spacer()
                
            }
            .padding()
            .onTapGesture {
                isRotated.toggle()
            }
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
