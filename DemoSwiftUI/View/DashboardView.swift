//
//  DashboardView.swift
//  DemoSwiftUI
//
//  Created by Yash Sorathiya  on 25/06/25.
//

import SwiftUI

struct DashboardView: View {
    @State private var selectedTab = 0
    
    let wallpapers = [
        "wallpaper1", "wallpaper2", "wallpaper3", "wallpaper4", "wallpaper5"
    ]
    let liveWallpapers = [
        "wallpaper6", "wallpaper7", "wallpaper8", "wallpaper9", "wallpaper10"
    ]
    let hdWallpapers = [
        "wallpaper11", "wallpaper12", "wallpaper13", "wallpaper14", "wallpaper15"
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case 0:
                    HomeView(wallpapers: wallpapers, liveWallpapers: liveWallpapers, hdWallpapers: hdWallpapers)
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                case 1:
                    WallpaperView()
                case 2:
                    NotificationsView()
                case 3:
                    SettingView()
                default:
                    EmptyView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            CustomTabBar(selectedTab: $selectedTab)
        }
    }
}

// MARK: - Custom Tab Bar
struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {
                selectedTab = 0
            }) {
                VStack {
                    Image(systemName: "house.fill")
                        .foregroundColor(.white)
                    Text("Home")
                        .font(.caption)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                )
                .cornerRadius(16)
            }
            
            Spacer()
            
            Button(action: {
                selectedTab = 1
            }) {
                Image(systemName: "pause.circle.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            Button(action: {
                selectedTab = 2
            }) {
                Image(systemName: "sun.max.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            Button(action: {
                selectedTab = 3
            }) {
                Image(systemName: "triangle.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
            }
            
            Spacer()
        }
        .padding(.vertical, 10)
        .background(Color.black)
    }
}

#Preview {
    DashboardView()
}
