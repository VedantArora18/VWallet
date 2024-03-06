//
//  SplashScreenView.swift
//  VWallet
//
//  Created by Vedant Arora on 29/02/24.
//


import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            
            WallView()
            
        } else{
            ZStack {
                Color.black
                    .ignoresSafeArea()
                VStack{
                    
                    VStack{
                        Image("Vicon")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 375, height: 375)
                            .font(.system(size: 50))
                        
                        
                        
                    }
                    
                    
                    
                    .scaleEffect(size)
                    .opacity(opacity)
                    .background(.white)
                    
                    .onAppear {
                        
                        withAnimation(.easeIn(duration: 1.2)){
                            
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
                
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                        withAnimation {
                            self.isActive = true
                        }
                        
                    }
                }
                
            }
        }
    }
}
        
        


struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
