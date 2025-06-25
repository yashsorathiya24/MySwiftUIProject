//
//  OnboardingView.swift
//  DemoSwiftUI
//
//  Created by Yash Sorathiya  on 25/06/25.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentIndex = 0
    @State private var isOnboardingComplete = false // 👈 navigation flag
    
    private let onboardingItems = [
        OnboardingItem(imageName: "Onboarding1", title: "Discover Unique", subtitle: "Wallpapers"),
        OnboardingItem(imageName: "Onboarding2", title: "Interactive Widgets", subtitle: "Experience"),
        OnboardingItem(imageName: "Onboarding3", title: "Daily Inspiration", subtitle: "Enjoy Updates")
    ]
    
    var body: some View {
        ZStack {
            TabView(selection: $currentIndex) {
                ForEach(0..<onboardingItems.count, id: \.self) { index in
                    OnboardingPage(
                        item: onboardingItems[index],
                        index: index,
                        currentIndex: $currentIndex,
                        count: onboardingItems.count,
                        onboardingComplete: $isOnboardingComplete
                    )
                    .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            // Skip Button Overlay
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        isOnboardingComplete = true
                    }) {
                        Text("Skip")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                    }
                }
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 44)
                .padding(.trailing, 16)
                Spacer()
            }
        }
        .ignoresSafeArea() // Ensures full screen usage
        .fullScreenCover(isPresented: $isOnboardingComplete) {
            DashboardView()
        }
    }
}

struct OnboardingPage: View {
    let item: OnboardingItem
    let index: Int
    @Binding var currentIndex: Int
    let count: Int
    @Binding var onboardingComplete: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(item.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                    .edgesIgnoringSafeArea(.all)
                
                LinearGradient(
                    gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.85)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    VStack(spacing: 12) {
                        Text(item.title)
                            .font(.system(size: 26, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        if !item.subtitle.isEmpty {
                            Text(item.subtitle)
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.white.opacity(0.85))
                                .multilineTextAlignment(.center)
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 16)
                    
                    HStack(spacing: 8) {
                        ForEach(0..<count, id: \.self) { i in
                            Capsule()
                                .fill(i == index ? Color.yellow : Color.white.opacity(0.3))
                                .frame(width: i == index ? 18 : 6, height: 6)
                        }
                    }
                    .padding(.bottom, 24)
                    
                    Button(action: {
                        withAnimation {
                            if currentIndex < count - 1 {
                                currentIndex += 1
                            } else {
                                onboardingComplete = true
                            }
                        }
                    }) {
                        HStack {
                            Text(currentIndex == count - 1 ? "Get Started" : "Continue")
                                .font(.system(size: 18, weight: .semibold))
                            Image(systemName: "chevron.right")
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.orange, Color.yellow]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(20)
                        .padding(.horizontal, 40)
                    }
                    .padding(.bottom, geometry.safeAreaInsets.bottom > 0 ? geometry.safeAreaInsets.bottom : 20)
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .bottom)
            }
        }
    }
}

#Preview {
    ContentView()
}
