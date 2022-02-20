//
//  FriendGiftCell.swift
//  Gifter
//
//  Created by Дарья Сербер on 20.02.2022.
//

import SwiftUI

public struct FriendGiftCell: View {
    
    public init(giftName: String, holiday: String) {
        self.gift = giftName
        self.holiday = holiday
    }
    
    let gift: String
    let holiday: String
    
    public var body: some View {
        buttonContent
    }
    
    var buttonContent: some View {
        VStack(alignment: .leading) {
            Text(gift)
                .font(.title3)
                .lineLimit(1)
                .foregroundColor(.black)
            Text(holiday)
                .font(.subheadline)
                .lineLimit(1)
                .foregroundColor(.gray)
        }
    }
}

