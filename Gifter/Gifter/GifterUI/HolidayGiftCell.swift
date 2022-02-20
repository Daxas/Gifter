//
//  HolidayGiftCell.swift
//  Gifter
//
//  Created by Дарья Сербер on 04.02.2022.
//

import SwiftUI

public struct HolidayGiftCell: View {
    
    public init(friendName: String, giftName: String? = nil, isBought: Bool? = nil) {
        self.friendName = friendName
        self.giftName = giftName
        self.isBought = isBought
    }
    
    let friendName: String
    let giftName: String?
    let isBought: Bool?
    
    public var body: some View {
        buttonContent
    }
    
    var buttonContent: some View {
        HStack(spacing: 15) {
            Image(systemName: "person.fill")
                .foregroundColor(.gray)
                .font(.title)
                .frame(width: 40, height: 40, alignment: .center)
                .background(getBackgroundColor())
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 1))
                .shadow(radius: 20)
                
            
            VStack(alignment: .leading) {
                Text(friendName)
                    .font(.title3)
                    .lineLimit(1)
                    .foregroundColor(.black)
                Text(giftName ?? "")
                    .font(.subheadline)
                    .lineLimit(1)
                    .foregroundColor(.gray)
            }
        }
    }
    
    private func getBackgroundColor() -> Color {
        if isBought ?? false {
            return .green.opacity(0.3)
        } else {
            return .orange.opacity(0.3)
        }
    }
}
