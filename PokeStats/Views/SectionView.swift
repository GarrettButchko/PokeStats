//
//  SectionView.swift
//  PokeStats
//
//  Created by Garrett Butchko on 1/7/25.
//

import Foundation
import SwiftUICore
import SwiftUI

struct SectionView<Content: View>: View {

    let title: String
    let titleLength: Int
    let num: Int
    let color: Color
    let content: Content
    
    init(title: String, titleLength: Int, num: Int, color: Color, @ViewBuilder content: () -> Content) {
        self.title = title
        self.titleLength = titleLength
        self.num = num
        self.content = content()
        self.color = color
    }

    var body: some View {
        
        Text(title)
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(.thickMaterial)
                    .frame(width: CGFloat(titleLength), height: 25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(color, lineWidth: 2)
                    )
            )
            .font(.headline)
            .foregroundStyle(color)
            .zIndex(1)
            .offset(y: -CGFloat(((num - 1) * 35)))


        VStack {
            content
        }
        .padding(22)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(.thinMaterial)
                .padding()
                .shadow(radius: 10)
        )
        .offset(y: -CGFloat((num * 35)))
        .frame(maxWidth: .infinity)
    }
}
