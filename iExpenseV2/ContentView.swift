//
//  ContentView.swift
//  iExpenseV2
//
//  Created by Jacek Placek on 16/07/2022.
//

import SwiftUI





struct ContentView: View {
@StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    var body: some View {
        
        NavigationView{
            List{
                ForEach(expenses.items){ item in
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount,format: .localCurrency)
                            .style(for: item)
                    }
                }
                .onDelete(perform: removeItems)
            }
            
            .toolbar {
                Button {
                    showingAddExpense = true
//                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
//                    expenses.items.append(expense)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .navigationTitle("Wydatki")
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
