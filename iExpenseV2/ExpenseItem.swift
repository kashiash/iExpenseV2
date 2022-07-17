//
//  ExpenseItem.swift
//  iExpenseV2
//
//  Created by Jacek Placek on 17/07/2022.
//

import Foundation


struct ExpenseItem: Identifiable,Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
