//
//  HolidayListScreen.swift
//  Gifter
//
//  Created by Дарья Сербер on 23.01.2022.
//

import SwiftUI
import UIKit

struct HolidayListScreen: View {
    
    @EnvironmentObject var router: Router
    @EnvironmentObject var holidaysModel: HolidaysListScreenViewModel
    
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
                            EditHolidayScreen()
                                .environmentObject(HolidayViewModel(selectedHoliday: HolidayEntity()))
                                .onDisappear { holidaysModel.loadData() }
                        })
                    }
                }
                .navigationBarTitle("", displayMode: .inline)
        }
        .onAppear { holidaysModel.loadData() }
    }
    
    var list: some View {
        List {
            ForEach(holidaysModel.holidaysList) { item in
                NavigationLink(destination: HolidayScreen().environmentObject(HolidayViewModel(selectedHoliday: item))) {
                    HolidayCell(holiday: item.name, date: item.date, icon: UIImage(systemName: "star.fill")) //todo
                }
            }
            .onDelete(perform: delete)
        }
    }
    
    private func delete(at offsets: IndexSet) {
        guard let index = Array(offsets).first else { return }
        let holiday = holidaysModel.holidaysList[index]
        holidaysModel.deleteHoliday(holiday: holiday)
    }
    
}
