//
//  GiftEntity.swift
//  Gifter
//
//  Created by Дарья Сербер on 04.02.2022.
//

import Foundation
import UIKit

public struct GiftEntity: Identifiable, Codable {
    
    public var id: String = UUID().uuidString
    var name: String = ""
    
    var description: String = ""
    var urlString: String = ""
    
    var price: String = ""
    var holiday: String = ""
    
    var isBought: Bool = false
    var isPacked: Bool = false
    var isGiven: Bool = false
    
}
