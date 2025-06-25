//
//  HomeView.swift
//  DemoSwiftUI
//
//  Created by Yash Sorathiya  on 25/06/25.
//

import SwiftUI


// MARK: - Home View
struct HomeView: View {
    let wallpapers: [String]
    let liveWallpapers: [String]
    let hdWallpapers: [String]
    
    @State private var selectedImage: WallpaperItem? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
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
            
            // List with sections
            List {
                Section(header: SectionHeader(title: "Wallpapers")) {
                    horizontalImageScrollView(wallpapers)
                }
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.black)
                
                Section(header: SectionHeader(title: "Live Wallpapers")) {
                    horizontalImageScrollView(liveWallpapers)
                }
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.black)
                
                Section(header: SectionHeader(title: "HD Wallpapers")) {
                    horizontalImageScrollView(hdWallpapers)
                        .padding(.bottom, 80) // Leave space for bottom tab
                }
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.black)
            }
            .listStyle(PlainListStyle())
            .background(Color.black)
        }
        .background(Color.black)
        .fullScreenCover(item: $selectedImage) { item in
            FullScreenView(imageName: item.name)
        }
    }
    
    // MARK: - Horizontal Image Scroll View
    func horizontalImageScrollView(_ images: [String]) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(images, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 200)
                        .cornerRadius(12)
                        .onTapGesture {
                            selectedImage = WallpaperItem(imageName: "", name: imageName)
                        }
                }
            }
            .padding(.horizontal)
            .padding(.vertical)
        }
    }
}

// MARK: - Section Header
struct SectionHeader: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title3)
                .bold()
                .foregroundColor(.white)
            Spacer()
            Text("View All")
                .font(.callout)
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
        .padding(.top, 8)
        .background(Color.black)
    }
}

// MARK: - Full Screen View
struct FullScreenView: View {
    let imageName: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                Spacer()
            }
        }
    }
}
