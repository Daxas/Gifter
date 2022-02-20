//
//  HolidaysListScreenViewModel.swift
//  Gifter
//
//  Created by Дарья Сербер on 23.01.2022.
//

import SwiftUI

final class HolidaysListScreenViewModel: ObservableObject {
    
    @Injected var repositoryService: RepositoryService?
    
    @Published var holidaysList: [HolidayEntity] = .init()
    
    init() { }
    
    func loadData() {
        holidaysList = repositoryService?.getAllHolidays() ?? []
    }
    
    func saveHoliday(holiday: HolidayEntity) {
        repositoryService?.saveHoliday(holiday: holiday)
        loadData()
    }
    
    func deleteHoliday(holiday: HolidayEntity) {
        repositoryService?.deleteHoliday(holiday: holiday)
        loadData()
    }
    
    func saveFriend(_ friend: FriendEntity, in holiday: HolidayEntity) {
        var updatedHoliday = holiday
        if let index = holiday.friendsList.firstIndex(where: { $0.id == friend.id }) {
            updatedHoliday.friendsList[index] = friend
        } else {
            updatedHoliday.friendsList.append(friend)
        }
        saveHoliday(holiday: updatedHoliday)
    }
    
}
