//
//  WallView.swift
//  VWallet
//
//  Created by Vedant Arora on 05/03/24.
//

import SwiftUI

struct WallView: View {
    @State private var isRotationEnabled: Bool = true
    @State private var showsIndicator: Bool = false
    var body: some View {
        
        NavigationStack {
            VStack{
                NavigationLink(destination: BioContent()) {
                    Text("Login")
                }
                GeometryReader {
                    let size = $0.size
                    
                    ScrollView(.horizontal){
                        HStack(spacing: 0){
                            ForEach(items) { item in
                                CardView(item)
                                    .padding(.horizontal, 65)
                                    .frame(width: size.width)
                                    .visualEffect { content, geometryProxy in
                                        content
                                            .offset(x: minX(geometryProxy))
                                    }
                                    .zIndex(items.zIndex(item))
                            }
                        }
                    }
                    .scrollTargetBehavior(.paging)
                    .scrollIndicators(showsIndicator ? .visible : .hidden)
                }
                .frame(height: 380)
                NavigationLink(destination: ContentView()) {
                    Text("Chat with Gemini")
                }
            }
            
            
            .navigationTitle("Your Wallet")
        }
    }
        
    @ViewBuilder
    func CardView(_ item: Item) -> some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(item.color.gradient)
    }
    
    func minX(_ proxy: GeometryProxy) -> CGFloat {
        let minX = proxy.frame(in: .scrollView(axis: .horizontal)).minX
        
        return minX < 0 ? 0 : -minX
    }
    
}

#Preview {
    WallView()
}
