//
//  FriendsListScreen.swift
//  Gifter
//
//  Created by Дарья Сербер on 23.01.2022.
//

import SwiftUI
import UIKit
import Foundation

struct FriendsListScreen: View {
    
    @EnvironmentObject var router: Router
    @EnvironmentObject var friendsModel: FriendsListScreenViewModel
    
    @State private var isShowModal = false
    
    var body: some View {
        NavigationView {
            list
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            self.isShowModal = true
                        } label: {
                            Image(systemName: "plus")
                        }
                        .sheet(isPresented: $isShowModal, content: {
                            VStack{
                                Button {
                                    self.isShowModal = false
                                } label: {
                                    Text("Add from contacts")
                                        .font(.headline)
                                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(20)
                                        .padding(.horizontal)
                                }
                                .padding()
                                
                                Button {
                                    self.isShowModal = false
                                } label: {
                                    Text("Create new")
                                        .font(.headline)
                                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(20)
                                        .padding(.horizontal)
                                }
                                .padding()
                            }
                        })
                    }
                }
                .navigationBarTitle("", displayMode: .inline)
        }
        .onAppear {
            friendsModel.loadData()
        }
    }
    
    var list: some View {
        List(friendsModel.friendsList) { item in
            NavigationLink(destination: FriendScreen().environmentObject(FriendViewModel(selectedFriend: item))) {
            FriendCell(friendName: item.name, bDate: item.bDate)
            }
        }
    }
    
}
