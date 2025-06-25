//
//  SettingView.swift
//  DemoSwiftUI
//
//  Created by Yash Sorathiya  on 25/06/25.
//

import SwiftUI

struct SettingView: View {
    
    var body: some View {
        NavigationView {
            List {
                
                // MARK: - Premium Access
                Section {
                    Button(action: {
                       
                    }) {
                        HStack {
                            Image(systemName: "crown.fill")
                                .foregroundColor(.white)
                            Text("GET PREMIUM ACCESS")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white.opacity(0.8))
                        }
                        .padding()
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.orange, Color.yellow]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(12)
                    }
                    .listRowBackground(Color.clear)
                }
                
                // MARK: - GENERAL
                Section(header: sectionHeader("GENERAL")) {
                    rowWithTrailing("Clear Memory", systemImage: "sparkles", trailing: "90 MB")
                    settingRow("Tell a Friend", systemImage: "paperplane.fill")
                    settingRow("Rate", systemImage: "star.fill")
                    settingRow("My Downloads", systemImage: "arrow.down.circle.fill")
                    settingRow("My Collections", systemImage: "square.stack.fill")
                }
                
                // MARK: - SUBSCRIPTION
                Section(header: sectionHeader("SUBSCRIPTION")) {
                    settingRow("Terms of Use", systemImage: "doc.text")
                    settingRow("Privacy Policy", systemImage: "shield.fill")
                    settingRow("Contact Us", systemImage: "envelope.fill")
                    settingRow("Restore Subscription", systemImage: "arrow.counterclockwise.circle.fill")
                }
            }
            .listStyle(.insetGrouped)
            .scrollContentBackground(.hidden)
            .background(Color(hex: "#121212"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Settings")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        // dismiss
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }

    // MARK: - Components
    func settingRow(_ title: String, systemImage: String) -> some View {
        Label(title, systemImage: systemImage)
            .foregroundColor(.white)
            .listRowBackground(Color(hex: "#232323"))
    }
    
    func rowWithTrailing(_ title: String, systemImage: String, trailing: String) -> some View {
        HStack {
            Label(title, systemImage: systemImage)
                .foregroundColor(.white)
            Spacer()
            Text(trailing)
                .foregroundColor(.gray)
                .font(.subheadline)
        }
        .listRowBackground(Color(hex: "#232323"))
    }
    
    func sectionHeader(_ title: String) -> some View {
        Text(title)
            .foregroundColor(.gray)
            .font(.caption)
            .padding(.top, 8)
    }
}

// MARK: - Color Hex Extension
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: UInt64
        switch hex.count {
        case 6: // RGB
            (r, g, b) = ((int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255
        )
    }
}

#Preview {
    SettingView()
}
