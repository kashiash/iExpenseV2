//
//  ContentView.swift
//  iExpenseV2
//
//  Created by Jacek Placek on 16/07/2022.
//

import SwiftUI





struct ContentView: View {
    @State private var user = User(firstName: "Taylor", lastName: "Swift")
    @State private var showingSheet = false
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
   // @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    @AppStorage("tapCount") private var tapCount = 0;
    
    func removeRows(at offsets: IndexSet){
        numbers.remove(atOffsets: offsets)
    }
    
    var body: some View {
        
        
        NavigationView{
            VStack{
                Button("Tap count: \(tapCount)") {
                      tapCount += 1
                 //   możemy wyłączyć bo jest w appstorage
                  //  UserDefaults.standard.set(self.tapCount, forKey: "Tap")
                  }
                
                Button("Save user"){
                    let encoder = JSONEncoder()
                    if let data = try? encoder.encode(user){
                        UserDefaults.standard.set(data,forKey: "UserData")
                    }
                }
                List{
                    ForEach(numbers, id: \.self){
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                    
                }
                Button("Add number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }.toolbar {
                EditButton()
            }
            
            
            
            //        Button("Show Sheet") {
            //            showingSheet.toggle()
            //          }
            //        .sheet(isPresented: $showingSheet) {
            //            SecondView(name: "Dupek")
            //        }
            
            //        VStack {
            //            Text("Your name is \(user.firstName) \(user.lastName).")
            //
            //            TextField("First name", text: $user.firstName)
            //            TextField("Last name", text: $user.lastName)
            //        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
