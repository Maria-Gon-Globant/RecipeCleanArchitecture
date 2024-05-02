//
//  CustomTabBar.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 22/04/24.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: String
    @State var tabPoints: [CGFloat] = []
    
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 0) {
                TabBarButton(image: "house", selectedTab: $selectedTab, tabPoints: $tabPoints)
                TabBarButton(image: "magnifyingglass", selectedTab: $selectedTab, tabPoints: $tabPoints)
                TabBarButton(image: "plus.circle", selectedTab: $selectedTab, tabPoints: $tabPoints)
                TabBarButton(image: "heart", selectedTab: $selectedTab, tabPoints: $tabPoints)
                TabBarButton(image: "person", selectedTab: $selectedTab, tabPoints: $tabPoints)
            }.padding()
                .background(
                    Color(.white)
                        .clipShape(TabCurve(tabPoint: getCurvePoint() - 15) )
                )
                .overlay(
                    Circle()
                        .fill(Color(hex: 0x070B9BE))
                        .frame(width: 10, height: 10)
                        .offset(x: getCurvePoint() - 20 )
                    , alignment: .bottomLeading
                )
                .cornerRadius(30)
                .shadow(radius: 10)
            .padding(.horizontal)
        }
    }
    
    func getCurvePoint() -> CGFloat {
        if tabPoints.isEmpty {
            return 10
        }
        else {
            switch selectedTab {
            case "house":
                return tabPoints[0]
            case "magnifyingglass":
                return tabPoints[1]
            case "plus.circle":
                return tabPoints[2]
            case "heart":
                return tabPoints[3]
            case "person":
                return tabPoints[4]
            default:
                return tabPoints[0]
            }
        }
    }
}

struct TabBarButton: View {
    var image: String
    @Binding var selectedTab: String
    @Binding var tabPoints: [CGFloat]
    
    var body: some View {
        GeometryReader {
            reader -> AnyView in
            
            let midX = reader.frame(in: .global).midX
            
            DispatchQueue.main.async {
                if tabPoints.count <= 5 {
                    tabPoints.append(midX)
                }
            }
            
            return AnyView(
                Button(action: {
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.5)) {
                        selectedTab = image
                    }
                }, label: {
                    Image(systemName: "\(image)\(selectedTab == image && image != "magnifyingglass" ? ".fill": "")")
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundStyle(Color(selectedTab == image ? Color(hex: 0x070B9BE) : .gray))
                        .offset(y: selectedTab == image ? -10 : 0)
                }).frame(maxWidth: .infinity, maxHeight: .infinity)
            )
        }.frame(height: 50)
    }
}
