//
//  FriendsListScreenViewModel.swift
//  Gifter
//
//  Created by Дарья Сербер on 23.01.2022.
//

import SwiftUI

final class FriendsListScreenViewModel: ObservableObject {
    
    @Injected var repositoryService: RepositoryService?
    
    @Published var friendsList: [FriendStoreEntity] = .init()
    
    init() { }
    
    func loadData() {
        friendsList = repositoryService?.getAllFriends() ?? []
    }
}
