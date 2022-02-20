//
//  FriendViewModel.swift
//  Gifter
//
//  Created by Дарья Сербер on 13.02.2022.
//

import SwiftUI

final class FriendViewModel: ObservableObject {
    
    @Injected var repositoryService: RepositoryService?
    
    @Published var friend: FriendStoreEntity = .init()
    
    init(selectedFriend: FriendStoreEntity) {
        self.selectedFriend = selectedFriend
    }
    
    private let selectedFriend: FriendStoreEntity
    
    func loadData() {
        friend = repositoryService?.getFriend(with: selectedFriend.id) ?? FriendStoreEntity()
    }
    
//    func setSelectedFriend(friend: FriendEntity) {
//        selectedFriend = friend
//    }
//    
    func saveFriend(_ friend: FriendStoreEntity) {
        repositoryService?.saveFriend(friend: friend)
        loadData()
    }
    
}

