//
//  LaunchDetailView.swift
//  LiftOff
//
//  Created by Meinecke, Alexander on 29.03.25.
//

import SwiftUI
import MapKit

struct LaunchDetailView: View {
    @State var progress: Double = 0
    @ObservedObject var viewModel: LaunchDetailViewModel
        
    var body: some View {
        
        ScrollView{
            
            VStack{
                rocketImage
                
                logo
                
                statusField(text: viewModel.launchOverview.status.name, background: .green.opacity(0.9))
                
                if !viewModel.isLoading {
                    countdown

                    weatherInformation

                    missionDescription
                    
                    details
                    
                    map
                }
                
                
            }
        }
        .navigationTitle(viewModel.launchOverview.name)
        .navigationBarTitleDisplayMode(.inline)
        .animation(.bouncy, value: viewModel.isLoading)
        .onAppear {
            viewModel.startCountdown()
        }
        .refreshable {
            viewModel.initializeFullViewModel()
        }
    }
    
    @ViewBuilder
    var missionDescription: some View {
        if let missionDescription = viewModel.launch?.mission?.description {
            detailBlock(title: "Mission Description", content: missionDescription)
                .italic()
                .padding()
        }
        
    }
    
    var rocketImage: some View{
        
        
        VStack{
            ZStack{

                Image("main_image")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                
                
                VStack(alignment: .trailing){
                    HStack{
                        Spacer()
                        if let weather = viewModel.launch?.weather {
                            Image(systemName: weather.isDay ? "sun.max.fill" : "moon.fill")
                            .font(.title)
                        }
                    }
                    Spacer()
                    HStack{
                        Spacer()
                        Text("Credits: \(viewModel.launch?.image?.credit ?? "Unknown")")
                            .font(.callout)
                            .italic()
                    }
                    
                }
                .padding()
                
            }

        }
        .cornerRadius(14)
        .padding()
        .animation(.bouncy, value: viewModel.isLoading)
    }
    

    
    func statusField(text: String, background: Color? = nil, foregroundStyle: Color? = nil) -> some View {
        Text(text)
            .bold()
            .foregroundStyle(foregroundStyle ?? .black)
            .padding(.horizontal)
            .background(background ?? .white)
            .cornerRadius(14)
    }
    
    var countdown: some View {
        VStack{
            Text(viewModel.launchCountdown)
                .bold()
                .font(.title)
                .monospaced()
            
            Text(viewModel.formatLaunchTimeString().formatted(date: .abbreviated, time: .standard))
                .foregroundStyle(.gray)
        }
        .padding()
        
    }
    
    var logo: some View {
        VStack{
            Image("spacex")
                .resizable()
                .scaledToFit()
        }
        .cornerRadius(14)
        .padding()
    }
    
    @ViewBuilder
    func detailBlock(title: String, content: String) -> some View {
        

        
        VStack(alignment: .leading){
            Text(title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(content)
                .bold()
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            Spacer()
        }
        .padding()
        .background(.gray.opacity(0.3))
        .cornerRadius(15)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
    
    @ViewBuilder
    func orbitDetails(orbitType: String) ->  some View {
        
        
        
        
        ZStack {
            // Orbits (optional)
            Ellipse()
                .stroke(Color.green, lineWidth: 1)
                .frame(width: 2*150/4, height: 2*80/4)
            
            Ellipse()
                .stroke(Color.pink, lineWidth: 1)
                .frame(width: 150, height: 80)
            
            Ellipse()
                .stroke(Color.orange, lineWidth: 1)
                .frame(width: 3*150/4, height: 3*80/4)
            

            Text("🚀")
                .font(.system(size: 14))
                .offset(
                    x: (3*150/8),
                    y: (3*80/8)
                )
            

            Text("🌍")
                .font(.system(size: 35))
        }
    }
    
    @ViewBuilder
    var details: some View {
        GeometryReader{ geometry in
            let columns = calculateColumnCount(for: geometry.size.width)
            
            let itemWidth: CGFloat = geometry.size.width / CGFloat(columns) - 16
            
            LazyVGrid(columns: Array(repeating: GridItem(.adaptive(minimum: itemWidth, maximum: itemWidth), spacing: 10), count: columns)) {
                
                if let statusDescription = viewModel.launch?.status.description {
                    detailBlock(title: "Status Description", content: statusDescription)
                }
                
                if let orbit = viewModel.launch?.mission?.orbit?.name {
                    detailBlock(title: "Orbit", content: orbit)
                }
                
                detailBlock(title: "Rocket", content: viewModel.launch?.rocket.name ?? "Loading...")
                
                

            }
            .padding()
        }
        .frame(height: 380)
    }
    
    func calculateColumnCount(for width: CGFloat) -> Int {
        
        let itemWidth: CGFloat = 190
        
        let columns = Int(width/itemWidth)
        
        return max(columns, 1)
    }
    
    var map: some View {
        VStack{
            Map(position: $viewModel.padPosition) {
                
                Marker(
                    viewModel.launch?.pad.name ?? "Loading...",
                    coordinate: CLLocationCoordinate2D(latitude: viewModel.launch?.pad.latitude ?? 0, longitude: viewModel.launch?.pad.longitude ?? 0))
            }
            .frame(height: 300)
            Text(viewModel.launch?.pad.location ?? "Loading...")
            .padding(.vertical)
            
        }
        .background(.gray.opacity(0.2))
        .cornerRadius(14)
        .padding()
        
    }
    
    var weatherInformation: some View {
            VStack{
                if let weather = viewModel.launch?.weather {
                    ScrollView(.horizontal) {
                        HStack{
                            statusField(text: "15:32 UTC")
                            
                            statusField(text: "\(viewModel.launch?.weather?.temperature ?? 0) \(viewModel.launch?.weather?.temperatureUnit ?? "C")")
                            
                            statusField(text: "Wind speed \(weather.windspeed) \(weather.windspeedUnit)")
                            
                            statusField(text: "Wind direction \(weather.winddirection)")
                            
                            statusField(text: "Weather code \(weather.weathercode)")
                            
                        }
                    }
                    .scrollIndicators(.hidden)
                }
            }
            .padding(.horizontal)

    }
    
    
    
}
/*
#Preview {
    LaunchDetailView(viewModel: , position: <#T##arg#>)
}
*/
