//
//  LandingPageView.swift
//  sleep2Earn-App
//
//  Created by Muhamad Azis on 23/01/25.
//

import SwiftUI

struct LandingPageView: View {
    @State private var showScondImage=false
    @State private var navigateToHome = false
    var body: some View {
        NavigationStack {
            ZStack{
                Color(hex:"131338")
                    .ignoresSafeArea()
                VStack {
                    if !showScondImage{
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .padding(.bottom, 20)
                            .transition(.opacity)
                    } else {
                        Image("logoText")
                            .resizable()
                            .scaledToFit()
                            .frame(width:240, height: 240)
                            .padding(.bottom, 20)
                            .transition(.opacity)
                    }
                }
                .padding()
                .onAppear(){
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                        withAnimation{
                            showScondImage.toggle()
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4){
                        navigateToHome=true
                    }
                }
                .navigationDestination(isPresented: $navigateToHome){
                    HomeView()
                }
            }
        }
    }
}

extension Color{
    init(hex:String){
        let scanner = Scanner(string: hex.trimmingCharacters(in: .whitespacesAndNewlines))
        scanner.currentIndex=hex.hasPrefix("#") ? hex.index(after: hex.startIndex) : hex.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let red = Double((rgbValue>>16)&0xFF)/255.0
        let green = Double((rgbValue>>8)&0xFF)/255.0
        let blue = Double((rgbValue&0xFF))/255.0
        self.init(red: red, green: green, blue: blue)
    }
}

#Preview {
    LandingPageView()
}
