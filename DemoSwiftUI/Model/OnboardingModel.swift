//
//  OnboardingModel.swift
//  DemoSwiftUI
//
//  Created by Yash Sorathiya  on 25/06/25.
//

import Foundation

struct OnboardingItem: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let subtitle: String
}
