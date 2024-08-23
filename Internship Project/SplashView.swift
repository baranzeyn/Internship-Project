//
//  SplashView.swift
//  Internship Project
//
//  Created by Zeynep Baran on 23.08.2024.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var size=0.8
    @State private var opacity=0.5
    var body: some View {
        if isActive{
            Onboarding()
        }else{
            ZStack{
                Color(hex:"4158A6")
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack{
                VStack{
                    Image("onboarding0")
                        .resizable()
                        .padding()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                    Text("Finance App")
                        .font(.title)
                        .foregroundColor(Color(hex: "F5EDED"))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size=0.9
                        self.opacity=1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    withAnimation{
                        self.isActive=true
                    }
                }
            }
          }
        }
    }
}

#Preview {
    SplashView()
}
