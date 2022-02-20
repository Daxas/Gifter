//
//  HolidayEntity.swift
//  Gifter
//
//  Created by Дарья Сербер on 23.01.2022.
//

import Foundation
import UIKit

struct HolidayEntity: Identifiable, Codable {
    
    var id: String = UUID().uuidString
    var name: String = ""
    var date: Date = Date()
    var description: String = ""
    var friendsList = [FriendEntity]()
    var budget: String = ""
    
}
