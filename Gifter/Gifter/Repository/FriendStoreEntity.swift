//
//  FriendStoreEntity.swift
//  Gifter
//
//  Created by Дарья Сербер on 20.02.2022.
//

import Foundation

struct FriendStoreEntity: Identifiable, Codable {
    
    var id: String
    var name: String
    var bDate: Date? = nil
    
    var description: String = ""
    var gifts = [GiftEntity]()
    
    init(friend: FriendEntity) {
        self.id = friend.id
        self.name = friend.name
        self.gifts.append(friend.gift)
    }
    
    init() {
        self.id = UUID().uuidString
        self.name = ""
    }
}
