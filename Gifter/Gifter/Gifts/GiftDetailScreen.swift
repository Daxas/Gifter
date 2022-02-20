//
//  GiftDetailScreen.swift
//  Gifter
//
//  Created by Дарья Сербер on 04.02.2022.
//

import SwiftUI

struct GiftDetailScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject private var model: HolidayViewModel
    
    init(for friend: FriendEntity) {
        self.friend = friend
    }
    
    private let friend: FriendEntity
    
    var body: some View {
        Form {
            Section(header: Text("Gift")) {
                TextField("Gift idea", text: $model.selectedFriend.gift.name)
            }
            Section(header: Text("Description")) {
                TextEditor(text: $model.selectedFriend.gift.description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Section(header: Text("Price")) {
                TextField("Price", text: $model.selectedFriend.gift.price)
            }
            Section(header: Text("Link")) {
                TextField("Link", text: $model.selectedFriend.gift.urlString)
            }
            Toggle("Is gift bought", isOn: $model.selectedFriend.gift.isBought)
            Toggle("Is gift packed", isOn: $model.selectedFriend.gift.isPacked)
                .disabled(!model.selectedFriend.gift.isBought)
            Toggle("Is gift presented", isOn: $model.selectedFriend.gift.isGiven)
                .disabled(!model.selectedFriend.gift.isBought)
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
        .navigationTitle(model.selectedFriend.name)
        .navigationBarTitle("", displayMode: .inline)
        .padding()
        .onAppear { model.setSelectedFriend(friend: friend) }
    }
    
}
