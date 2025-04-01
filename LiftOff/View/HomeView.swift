//
//  HomeView.swift
//  LiftOff
//
//  Created by Meinecke, Alexander on 28.03.25.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var homeViewModel: LaunchScreenViewModel
    
    var body: some View {
        VStack{
            NavigationView {
                ScrollView {
                    content
                        .padding(.horizontal)
                    
                    
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
                Text("\(homeViewModel.launches.first?.name ?? "Loading")")
                    .bold()

                    .padding()
                Image("main_image")
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 14,bottomLeading: 14,bottomTrailing: 14,topTrailing: 14)))
                    .padding(.horizontal)
                
                Text(homeViewModel.launches.first?.net ?? "Loading")
                    .bold()
                    .font(.title)
                    .monospaced()
                    .padding()
                }
            //.background(Color.gray.opacity(0.1))
            .cornerRadius(12)
            
            VStack{
                
                ForEach(homeViewModel.launches, id: \.id) { launch in
                    standardLaunchRow(imageName: "thumbnail_image", name: launch.name, startDate: launch.net)
                }

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
                    Text(name)
                        .bold()
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)

                    Text(startDate)
                        .multilineTextAlignment(.leading)
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
    HomeView(homeViewModel: LaunchScreenViewModel())
}
