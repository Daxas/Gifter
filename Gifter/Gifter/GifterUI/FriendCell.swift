//
//  FriendCell.swift
//  Gifter
//
//  Created by Дарья Сербер on 23.01.2022.
//

import SwiftUI

public struct FriendCell: View {
    
    public init(friendName: String, bDate: Date?) {
        self.friendName = friendName
        
        if let date = bDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            self.bDate = dateFormatter.string(from: date)
        }
    }
    
    public var body: some View {
        buttonContent
    }
    
    private let friendName: String
    private var bDate: String? = nil
    
    var buttonContent: some View {
        HStack(spacing: 15) {
            Image(systemName: "person.fill")
                .foregroundColor(.purple)
                .font(.title)
                .frame(width: 50, height: 50, alignment: .center)
                .cornerRadius(25)
                .overlay(RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.gray, lineWidth: 1))
                .shadow(radius: 25)
            
            VStack(alignment: .leading) {
                Text(friendName)
                    .font(.title2)
                    .lineLimit(1)
                    .foregroundColor(.black)
                Text(bDate ?? "")
                    .font(.subheadline)
                    .lineLimit(1)
                    .foregroundColor(.gray)
            }
        }
    }
}
