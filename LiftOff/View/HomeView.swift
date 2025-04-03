//
//  HomeView.swift
//  LiftOff
//
//  Created by Meinecke, Alexander on 28.03.25.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var homeViewModel: HomeViewModel
    
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
                .refreshable {
                    homeViewModel.loadLauchesOverview()
                    print(homeViewModel.launchDetailViewModels.first?.launchOverview.name ?? "Nix da :(")
                }
            }
        }
        
            
    }
    
    @ViewBuilder
    var content: some View {
        VStack{
            
            
            VStack{
                Text(homeViewModel.launchDetailViewModels.first?.launchOverview.name ?? "Loading...")
                    .bold()

                    .padding()
                Image("main_image")
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 14,bottomLeading: 14,bottomTrailing: 14,topTrailing: 14)))
                    .padding(.horizontal)
                
                if let nextUpcomingLaunch = homeViewModel.launchDetailViewModels.first {
                    Text(nextUpcomingLaunch.launchCountdown)
                        .bold()
                        .font(.title)
                        .monospaced()
                        .padding()
                }
                
 
                }
                .cornerRadius(12)
                .onAppear {
                    print("Trying to start countdown")
                    
                }
            VStack{
                ForEach(homeViewModel.launchDetailViewModels) { launchViewModel in
                    standardLaunchRow(imageName: "thumbnail_image", viewModel: launchViewModel)
                }
            }
        }
    }
    
    @ViewBuilder
    func standardLaunchRow(imageName: String, viewModel: LaunchDetailViewModel) -> some View {
        NavigationLink {
            LaunchDetailView(viewModel: viewModel)
                .onAppear {
                    viewModel.initializeFullViewModel()
                }
        } label: {
            HStack{
                Image("thumbnail_image")
                    .resizable()
                    .frame(width: 55, height: 55)
                    .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 14,bottomLeading: 14,bottomTrailing: 14,topTrailing: 14)))
                
                
                VStack(alignment: .leading){
                    Text(viewModel.launchOverview.name)
                        .bold()
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)

                    Text(viewModel.formatLaunchTimeString().formatted(date: .abbreviated, time: .shortened))
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
    HomeView(homeViewModel: HomeViewModel())
}
