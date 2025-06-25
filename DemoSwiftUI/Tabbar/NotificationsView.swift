//
//  NotificationsView.swift
//  DemoSwiftUI
//
//  Created by Yash Sorathiya  on 25/06/25.
//

import SwiftUI

struct NotificationsView: View {
    
    let wallpapers = [
        "wallpaper1", "wallpaper2", "wallpaper3",
        "wallpaper4", "wallpaper5", "wallpaper6",
        "wallpaper7", "wallpaper8", "wallpaper9",
        "wallpaper10", "wallpaper11", "wallpaper12",
        "wallpaper13", "wallpaper14", "wallpaper15"
    ].map { WallpaperItem(imageName: "", name: $0) }
    
    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
    
    @State private var selectedImage: WallpaperItem? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "heart.fill")
                    .foregroundColor(.white)
                Spacer()
                Text("10k+ Wallpaper Pro")
                    .foregroundColor(.yellow)
                    .fontWeight(.bold)
                    .padding(8)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(8)
                Spacer()
                Image(systemName: "gearshape.fill")
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color.black)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(wallpapers) { item in
                        GeometryReader { geo in
                            Image(item.name)
                                .resizable()
                                .scaledToFill()
                                .frame(width: geo.size.width, height: geo.size.width)
                                .clipped()
                                .cornerRadius(12)
                                .onTapGesture {
                                    selectedImage = item
                                }
                        }
                        .aspectRatio(1, contentMode: .fit)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
                .padding(.bottom, 100)
            }
            .background(Color.black)
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.bottom)
        .fullScreenCover(item: $selectedImage) { item in
            WallpaperFullScreenView(imageName: item.name)
        }
    }
}

#Preview {
    NotificationsView()
}
