//
//  ContentView.swift
//  Gifter
//
//  Created by Дарья Сербер on 22.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var router: Router
    @StateObject var holidaysModel: HolidaysListScreenViewModel = .init()
    @StateObject var friendsModel: FriendsListScreenViewModel = .init()
    
    var body: some View {
        TabView(selection: $router.selection) {
            HolidayListScreen()
                .environmentObject(holidaysModel)
                .tabItem {
                    Text("Holidays")
                    Image(systemName: "giftcard.fill")
                }
                .tag(0)
            FriendsListScreen()
                .environmentObject(friendsModel)
                .tabItem {
                    Text("Friends")
                    Image(systemName: "person.2.fill")
                }
                .tag(1)
        }
    }
}

