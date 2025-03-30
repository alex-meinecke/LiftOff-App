//
//  LaunchDetailView.swift
//  LiftOff
//
//  Created by Meinecke, Alexander on 29.03.25.
//

import SwiftUI
import MapKit

struct LaunchDetailView: View {
    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 19.618452, longitude: 110.955356),
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        )
    )
    
    var body: some View {
        
        ScrollView{
            
            VStack{
                rocketImage
                
                logo
                
                statusField(text: "Launch Successful", background: .green.opacity(0.9))
                
                countdown
                                
                
                
                weatherInformation

                missionDescription
                
                details
                
                map
            }
        }
        .navigationTitle("Spectrum | Maiden Flight")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var missionDescription: some View {
        detailBlock(title: "Mission Description", content: "A batch of satellites for the Starlink mega-constellation - SpaceX's project for space-based Internet communication system.")
            .italic()
            .padding()
    }
    
    var rocketImage: some View{
        
        
        VStack{
            ZStack{
                Image("main_image")
                    .resizable()
                    .scaledToFit()
                VStack(alignment: .trailing){
                    HStack{
                        Spacer()
                        Image(systemName: "moon.fill")
                            .font(.title)
                    }
                    Spacer()
                    HStack{
                        Spacer()
                        Text("Credits: XY")
                            .font(.callout)
                            .italic()
                    }
                    
                }
                .padding()
                
            }

        }
        .cornerRadius(14)
        .padding()
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
            Text("T- 01:21:34")
                .bold()
                .font(.title)
                .monospaced()
                
            Text("2025-03-29 - 16:05:00")
                .foregroundStyle(.gray)
        }
        .padding()
        
    }
    
    var logo: some View {
        Image("spacex")
            .resizable()
            .scaledToFit()
            .padding()
    }
    
    var detailBlock: some View {
        VStack(alignment: .leading){
            
            Text("Mission Details")
                .bold()
            Text("Spectrum Maiden Flight")
                .bold()
                .font(.title2)
        }
        .padding()
        .background(.gray.opacity(0.2))
        .cornerRadius(15)
        

    }
    
    func detailBlock(title: String, content: String) -> some View {
        VStack(alignment: .leading){
            
            Text(title)
                .bold()
            Text(content)
                .bold()
                .font(.title2)
            
            Spacer()
        }
        .padding()
        .background(.gray.opacity(0.3))
        .cornerRadius(15)
    }
    
    @ViewBuilder
    var details: some View {
        GeometryReader{ geometry in
            let columns = calculateColumnCount(for: geometry.size.width)
            
            let itemWidth: CGFloat = geometry.size.width / CGFloat(columns) - 16
            
            LazyVGrid(columns: Array(repeating: GridItem(.adaptive(minimum: itemWidth, maximum: itemWidth), spacing: 10), count: columns)) {
                detailBlock(title: "Mission Details", content: "Spectrum Maiden Flight")
                detailBlock(title: "Orbit", content: "Geostationary Transfer Orbit")
                detailBlock(title: "Rocket Name 🚀", content: "Long March 7A")
                detailBlock(title: "Mission Details", content: "Spectrum Maiden Flight")
                detailBlock(title: "Mission Details", content: "Spectrum Maiden Flight")
                detailBlock(title: "Mission Details", content: "Spectrum Maiden Flight")

            }
            .padding(.horizontal)
        }
        .frame(height: 350)
    }
    
    func calculateColumnCount(for width: CGFloat) -> Int {
        
        let itemWidth: CGFloat = 200
        
        let columns = Int(width/itemWidth)
        
        return max(columns, 1)
    }
    
    var map: some View {
        VStack{
            Map(position: $position)
                .frame(height: 300)
            Text("Wenchang Space Launch Site, People's Republic of China")
            .padding(.vertical)
            
        }
        .background(.gray.opacity(0.2))
        .cornerRadius(14)
        .padding()
        
    }
    
    var weatherInformation: some View {
        VStack{
            ScrollView(.horizontal) {
                HStack{
                    statusField(text: "15:32 UTC")
                    
                    statusField(text: "21.7 °C")
                    
                    statusField(text: "Wind speed 13.4 km/h")
                    
                    statusField(text: "Wind direction 126°")
                    
                    statusField(text: "Weather code 3")
                                
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding(.horizontal)
        
    }
    
    func weatherInfoBlock(content: String) -> some View {
        VStack(alignment: .leading){

            Text(content)
                .bold()
                .font(.title2)
            
            Spacer()
        }
        .padding(.horizontal)
        .background(.gray.opacity(0.3))
        .cornerRadius(15)
    }
    
    
    
}

#Preview {
    LaunchDetailView()
}
