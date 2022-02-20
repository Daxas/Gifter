//
//  FriendScreen.swift
//  Gifter
//
//  Created by Дарья Сербер on 04.02.2022.
//

import SwiftUI

struct FriendScreen: View {
    
    @State private var isShowModal = false
    @State private var isShowFriendModal = false
    @EnvironmentObject private var model: FriendViewModel
    
    
    init() { }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person.fill")
                    .foregroundColor(.yellow)
                    .font(.title)
                    .frame(width: 80, height: 80, alignment: .center)
                    .cornerRadius(40)
                    .overlay(RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.gray, lineWidth: 1))
                    .shadow(radius: 40)
                
                VStack(alignment: .leading) {
                    Text(model.friend.name)
                        .font(.title)
                        .bold()
                    Text("Birthday: \(formate(date: model.friend.bDate))")
                        .foregroundColor(.gray)
                }
                .padding()
            }
            .padding()
            
            List(model.friend.gifts) { item in
                FriendGiftCell(giftName: item.name, holiday: item.holiday)
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
                    EditFriendScreen()
                        .environmentObject(model)
                })
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .onAppear { model.loadData() }
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
