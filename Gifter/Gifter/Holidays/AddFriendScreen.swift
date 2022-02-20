//
//  AddFriendScreen.swift
//  Gifter
//
//  Created by Дарья Сербер on 23.01.2022.
//

import SwiftUI

struct AddFriendScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject private var model: HolidayViewModel
    
    init(friend: FriendEntity) {
        self.friend = friend
    }
    
    private let friend: FriendEntity
    
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 20))
                }
            }
            .padding()
            
            Form {
                Section(header: Text("Friend")) {
                    TextField("Friend name", text: $model.selectedFriend.name)
                }
                Section(header: Text("Gift")) {
                    TextField("Gift idea", text: $model.selectedFriend.gift.name)
                }
                Section(header: Text("Description")) {
                    TextEditor(text: $model.selectedFriend.gift.description)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Section(header: Text("Max price")) {
                    TextField("Price", text: $model.selectedFriend.gift.price)
                }
                Section(header: Text("Link")) {
                    TextField("Link", text: $model.selectedFriend.gift.urlString)
                }
            }
            
            Button {
                model.saveFriend(model.selectedFriend)
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Save")
                    .font(.headline)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
            }
            .padding()
        }
        .onAppear { model.setSelectedFriend(friend: friend) }
    }
}



