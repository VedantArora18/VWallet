//
//  BioContent.swift
//  VWallet
//
//  Created by Vedant Arora on 06/03/24.
//

import SwiftUI
import LocalAuthentication

struct BioContent: View {
    @State private var unlocked = false
    @State private var text = "Locked"
    @State private var navigationActive = false
    var body: some View {
        VStack{
            
            Button("Login with FaceID"){
                authenticate()
            }
        }
    }
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "For Wallet Security" ){success, authenticationError in
                if success {
                    ViewCall()
                    
                }else {
                    text = "Retry"
                }
            }
        } else {
            text = "Phone doesn't have the Face id"
        }
    }
    func ViewCall(){
        NavigationLink(destination: ContentView()) {
            ContentView()
        }
    }
        
}
