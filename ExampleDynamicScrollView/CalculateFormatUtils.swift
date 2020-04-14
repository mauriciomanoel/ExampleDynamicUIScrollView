//
//  CalculateFormatUtils.swift
//  iOSCalculateCanadianPersonal
//
//  Created by Mauricio on 4/9/20.
//  Copyright © 2020 ITSCREDIT. All rights reserved.
//

import Foundation

class CalculateFormatUtils {
    
    public static func getValueFormatted(value: NSNumber, locale: Locale = Locale(identifier: "en_CA"), numberStyle: NumberFormatter.Style = .currency) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = numberStyle
        currencyFormatter.locale = locale
        if let priceString = currencyFormatter.string(from: value) {
            return priceString;
        }
        return ""
    }
    
    //    private func getValueFormatted(_ value: NSNumber) -> String {
    //        let currencyFormatter = NumberFormatter()
    //        let locale = Locale(identifier: "pt_PT")
    //        currencyFormatter.numberStyle = .percent
    //        currencyFormatter.locale = locale
    //        currencyFormatter.maximumFractionDigits = 3
    //        if let priceString = currencyFormatter.string(from: value) {
    //            return priceString;
    //        }
    //        return ""
    //    }
    
}
