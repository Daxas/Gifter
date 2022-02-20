//
//  RepositoryService.swift
//  Gifter
//
//  Created by Дарья Сербер on 23.01.2022.
//

import UserDefaultsStore

protocol RepositoryServiceProtocol {
    func getAllHolidays() -> [HolidayEntity]
    func getHoliday(with id: String) -> HolidayEntity?
    func saveHoliday(holiday: HolidayEntity)
    func deleteHoliday(holiday: HolidayEntity)
    
    func getAllFriends() -> [FriendStoreEntity]
    func getFriend(with id: String) -> FriendStoreEntity?
    func saveFriend(friend: FriendStoreEntity)
    func deleteFriend(friend: FriendStoreEntity)
}

class RepositoryService: RepositoryServiceProtocol {
    
    let friendsStore = UserDefaultsStore<FriendStoreEntity>(uniqueIdentifier: "friends")
    let holidaysStore = UserDefaultsStore<HolidayEntity>(uniqueIdentifier: "holidays")
    
    init() { }
    
    //MARK: Holidays
    
    func getAllHolidays() -> [HolidayEntity] {
        return holidaysStore.allObjects().sorted { $0.date < $1.date }
    }
    
    func getHoliday(with id: String) -> HolidayEntity? {
        return holidaysStore.object(withId: id)
    }
    
    func saveHoliday(holiday: HolidayEntity) {
        try? holidaysStore.save(holiday)
        holiday.friendsList.forEach { saveFriend(friend: FriendStoreEntity(friend: $0)) }
    }
    
    func deleteHoliday(holiday: HolidayEntity) {
        holidaysStore.delete(withId: holiday.id)
    }
    
    
    //MARK: Friends
    
    func getAllFriends() -> [FriendStoreEntity] {
        return friendsStore.allObjects()
    }
    
    func getFriend(with id: String) -> FriendStoreEntity? {
        return friendsStore.object(withId: id)
    }
    
    func saveFriend(friend: FriendStoreEntity) {
        try? friendsStore.save(friend)
    }
    
    func deleteFriend(friend: FriendStoreEntity) {
        friendsStore.delete(withId: friend.id)
    }
    
}
