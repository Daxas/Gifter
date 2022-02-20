//
//  FriendEntity.swift
//  Gifter
//
//  Created by Дарья Сербер on 23.01.2022.
//

import Foundation

struct FriendEntity: Identifiable, Codable {
    
    var id: String = UUID().uuidString
    var name: String = ""
    var gift: GiftEntity = .init()
    
}
