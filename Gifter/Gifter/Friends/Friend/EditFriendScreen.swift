//
//  EditFriendScreen.swift
//  Gifter
//
//  Created by Дарья Сербер on 20.02.2022.
//

import SwiftUI

struct EditFriendScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject private var model: FriendViewModel
    
    init() { }
    
    private var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .day, value: -40000, to: Date())!
        let max = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
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
                Section(header: Text("Person")) {
                    TextField("Name", text: $model.friend.name)
                }
                Section(header: Text("Favorite books, films, colors, person's size etc.")) {
                    TextEditor(text: $model.friend.description)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    DatePicker(
                        selection: $model.friend.bDate.onNone(Date()),
                        in: dateClosedRange,
                        displayedComponents: .date,
                        label: { Text("Birthday") }
                    )
                }
            }
            
            Button {
                model.saveFriend(model.friend)
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

extension Binding where Value == Date? {
    func onNone(_ fallback: Date) -> Binding<Date> {
        return Binding<Date>(get: {
            return self.wrappedValue ?? fallback
        }) { value in
            self.wrappedValue = value
        }
    }
}
