//
//  HomeView.swift
//  LiftOff
//
//  Created by Meinecke, Alexander on 28.03.25.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        VStack{
            NavigationView {
                ScrollView {
                    content
                    
                    
                }
                .navigationTitle("LiftOff.")
                .navigationBarTitleDisplayMode(.large)
                .background(.black)
                
            }
        }
        
            
    }
    
    @ViewBuilder
    var content: some View {
        VStack{
            
            
            VStack{
                Text("Spectrum | Maiden Flight")
                    .bold()

                    .padding()
                Image("main_image")
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 14,bottomLeading: 14,bottomTrailing: 14,topTrailing: 14)))
                    .padding(.horizontal)
                
                Text("T- 01:21:34")
                    .bold()
                    .font(.title)
                    .padding()
                }
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)
            
            VStack{
                standardLaunchRow(imageName: "thumbnail_image", name: "Spectrum | Maiden Flight", startDate: "04.04.2025")
                standardLaunchRow(imageName: "thumbnail_image", name: "Spectrum | Maiden Flight", startDate: "04.04.2025")
                standardLaunchRow(imageName: "thumbnail_image", name: "Spectrum | Maiden Flight", startDate: "04.04.2025")
                standardLaunchRow(imageName: "thumbnail_image", name: "Spectrum | Maiden Flight", startDate: "04.04.2025")
                standardLaunchRow(imageName: "thumbnail_image", name: "Spectrum | Maiden Flight", startDate: "04.04.2025")

            }


            
            
            
        }
    }
    
    @ViewBuilder
    func standardLaunchRow(imageName: String, name: String, startDate: String) -> some View {
        NavigationLink {
            LaunchDetailView()
        } label: {
            HStack{
                Image("thumbnail_image")
                    .resizable()
                    .frame(width: 55, height: 55)
                    .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 14,bottomLeading: 14,bottomTrailing: 14,topTrailing: 14)))
                
                
                VStack(alignment: .leading){
                    Text("Spectrum | Maiden Flight")
                        .bold()
                    Text("04.04.2025")
                }
                
                Spacer()
                
                
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(15)
        }
        .foregroundStyle(.white)

        
        
        
    }
    
    
}

#Preview {
    HomeView()
}
