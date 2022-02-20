//
//  EditHolidayScreen.swift
//  Gifter
//
//  Created by Дарья Сербер on 12.02.2022.
//

import SwiftUI

struct EditHolidayScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject private var model: HolidayViewModel
    
    init() { }
    
    private var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        let max = Calendar.current.date(byAdding: .day, value: 1000, to: Date())!
        return min...max
    }
    
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
                Section(header: Text("Holiday")) {
                    TextField("Holiday name", text: $model.holiday.name)
                }
                Section(header: Text("Description")) {
                    TextEditor(text: $model.holiday.description)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    DatePicker(
                        selection: $model.holiday.date,
                        in: dateClosedRange,
                        displayedComponents: .date,
                        label: { Text("Date") }
                    )
                }
                Section(header: Text("Budget")) {
                    TextField("Holiday budget", text: $model.holiday.budget)
                }
            }
            
            Button {
                model.saveHoliday()
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
        .onAppear { model.loadData() }
    }
        
}
