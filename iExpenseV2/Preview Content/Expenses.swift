//
//  Expenses.swift
//  iExpenseV2
//
//  Created by Jacek Placek on 17/07/2022.
//

import Foundation


class Expenses: ObservableObject{
    @Published var items = [ExpenseItem]()
}
