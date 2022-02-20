//
//  HolidayViewModel.swift
//  Gifter
//
//  Created by Дарья Сербер on 20.02.2022.
//

import SwiftUI

final class HolidayViewModel: ObservableObject {
    
    @Injected var repositoryService: RepositoryService?
    
    @Published var holiday: HolidayEntity = .init()
    @Published var selectedFriend: FriendEntity = .init()
    
    @Published var currentBudget: Double = 0
    @Published var totalGifts: Double = 0
    @Published var currentGifts: Double = 0
    @Published var giftsProgress: Double = 0
    @Published var budgetProgress: Double = 0
    
    init(selectedHoliday: HolidayEntity) {
        self.selectedHoliday = selectedHoliday
    }
    
    private let selectedHoliday: HolidayEntity
    
    func loadData() {
        holiday = repositoryService?.getHoliday(with: selectedHoliday.id) ?? HolidayEntity()
        calculateProgress()
    }
    
    func saveHoliday() {
        repositoryService?.saveHoliday(holiday: holiday)
//        loadData()
    }
    
    func deleteHoliday() {
        repositoryService?.deleteHoliday(holiday: holiday)
    }
    
    func setSelectedFriend(friend: FriendEntity) {
        selectedFriend = friend
    }
    
    func saveFriend(_ friend: FriendEntity) {
        if let index = holiday.friendsList.firstIndex(where: { $0.id == friend.id }) {
            holiday.friendsList[index] = friend
        } else {
            holiday.friendsList.append(friend)
        }
        saveHoliday()
    }
    
    private func calculateProgress() {
        currentBudget = holiday.friendsList.map({Double($0.gift.price) ?? 0}).reduce(0.0, +)
        totalGifts = Double(holiday.friendsList.count)
        let filteredList = holiday.friendsList.filter { $0.gift.isBought }
        currentGifts = Double(filteredList.count)
        
        giftsProgress = totalGifts == 0 ? 0 : currentGifts/totalGifts
        guard let budgetDouble = Double(holiday.budget) else { return }
        budgetProgress = budgetDouble == 0 ? 0 : currentBudget/budgetDouble
    }
    
}
