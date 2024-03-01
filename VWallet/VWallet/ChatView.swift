//
//  ChatView.swift
//  VWallet
//
//  Created by Vedant Arora on 29/02/24.
//

import SwiftUI
import GoogleGenerativeAI

struct ChatView: View {
    let model = GenerativeModel(name: "gemini-pro", apiKey: APIKey.default)
    @State var textInput = ""
    @State var aiResponse = "Hi! How can I help you?"
    var body: some View {
        VStack {
            Image("BotIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 100)
            Text("ChatBot")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .foregroundColor(.blue)
            ScrollView{
                Text(aiResponse)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
            }
            HStack{
                TextField("Enter a message", text: $textInput)
                    .textFieldStyle(.roundedBorder)
                    .foregroundColor(.black)
                Button(action: sendMessage, label:{
                    
                    Image(systemName: "paperplane.fill")
                           
                })
            }
        }
        .padding()
        .background{
            ZStack{
                Color.black
            }
            .ignoresSafeArea()
        }
        
    }
    
    func sendMessage() {
        aiResponse = ""
        Task{
            do{
                let response = try await model.generateContent(textInput)
                
                
                guard let text = response.text else{
                    textInput = "I'm not sure I understand. \nTry Again!"
                    return
                }
                
                textInput = ""
                aiResponse = text
            }catch{
                aiResponse = "Something went wrong! \n\(error.localizedDescription)"
            }
        }
    }
}

#Preview {
    ChatView()
}
