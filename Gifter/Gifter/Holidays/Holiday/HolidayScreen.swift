//
//  HolidayScreen.swift
//  Gifter
//
//  Created by Дарья Сербер on 23.01.2022.
//

import SwiftUI

struct HolidayScreen: View {
    
    @State private var isShowModal = false
    @State private var isShowFriendModal = false
    @EnvironmentObject private var model: HolidayViewModel
    
    
    init() { }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.title)
                    .frame(width: 80, height: 80, alignment: .center)
                    .cornerRadius(40)
                    .overlay(RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.gray, lineWidth: 1))
                    .shadow(radius: 40)
                
                VStack(alignment: .leading) {
                    Text(model.holiday.name)
                        .font(.title)
                        .bold()
                    
                    Text(formate(date: model.holiday.date))
                        .foregroundColor(.gray)
                }
                .padding()
            }
            .padding()
            
            HStack {
                Text("Gifts progress")
                ProgressView.init(value: model.giftsProgress) {
                    Label.init(String(format: "%.0f", model.totalGifts), image: "")
                } currentValueLabel: {
                    Label.init(String(format: "%.0f", model.currentGifts), image: "")
                }
                    .progressViewStyle(.linear)
                    .frame(width: 250)
            }
            .padding()
            
            HStack {
                Text("Budget progress")
                ProgressView.init(value: model.budgetProgress) {
                    Label.init(model.holiday.budget, image: "")
                } currentValueLabel: {
                    Label.init(String(format: "%.0f", model.currentBudget), image: "")
                }
                .progressViewStyle(.linear)
                .frame(width: 250)
            }
            .padding()
            
            Button {
                self.isShowFriendModal = true
            } label: {
                Text("Add new friend")
                    .font(.headline)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
            }
            .padding()
            
            List {
                ForEach(model.holiday.friendsList) { item in
                    NavigationLink(destination: GiftDetailScreen(for: item).environmentObject(model))
                    {
                        HolidayGiftCell(friendName: item.name, giftName: item.gift.name, isBought: item.gift.isBought)
                    }
                }
                .onDelete(perform: delete)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    self.isShowModal = true
                } label: {
                    Image(systemName: "pencil")
                }
                .sheet(isPresented: $isShowModal, content: {
                    EditHolidayScreen()
                        .environmentObject(model)
                })
                .sheet(isPresented: $isShowFriendModal, content: {
                    AddFriendScreen(friend: FriendEntity())
                        .environmentObject(model)
                })
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .onAppear {
            model.loadData()
        }
    }
    
    private func delete(at offsets: IndexSet) {
        guard let index = Array(offsets).first else { return }
        model.holiday.friendsList.remove(at: index)
        model.saveHoliday()
    }
    
    private func formate(date: Date?) -> String {
        let formatter = DateFormatter()
        guard let date = date else {
            return "Unknown"
        }
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.string(from: date)
    }
}
