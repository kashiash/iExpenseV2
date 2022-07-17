//
//  CurrencyFormatStyle.swift
//  iExpenseV2
//
//  Created by Jacek Placek on 17/07/2022.
//

import Foundation


extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
    static var localCurrency: Self {
        .currency(code: Locale.current.currencyCode ?? "USD")
    }
}



