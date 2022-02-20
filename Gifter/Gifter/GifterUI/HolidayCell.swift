//
//  HolidayCell.swift
//  Gifter
//
//  Created by Дарья Сербер on 23.01.2022.
//

import SwiftUI
import Foundation

public struct HolidayCell: View {
    
    public init(holiday: String, date: Date, icon: UIImage?) {
        self.holiday = holiday
        self.date = date
        self.icon = icon
    }
    
    let holiday: String
    let date: Date
    let icon: UIImage?
    
    public var body: some View {
        buttonContent
    }
    
    var buttonContent: some View {
        HStack(spacing: 15) {
            Image(systemName: "calendar")
                .foregroundColor(.yellow)
                .font(.title)
                .frame(width: 50, height: 50, alignment: .center)
                .cornerRadius(25)
                .overlay(RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.gray, lineWidth: 1))
                .shadow(radius: 25)
            
            VStack(alignment: .leading) {
                Text(self.holiday)
                    .font(.title2)
                    .lineLimit(1)
                    .foregroundColor(.black)
                Text("left \(numberOfDays(to: self.date)) days")
                    .font(.subheadline)
                    .lineLimit(1)
                    .foregroundColor(.gray)
            }
        }
    }
    
    private func numberOfDays(to: Date) -> String {
        let numberOfdays = Calendar.current.dateComponents([.day], from: Date(), to: to)
        return String(numberOfdays.day ?? 0)
    }
}
