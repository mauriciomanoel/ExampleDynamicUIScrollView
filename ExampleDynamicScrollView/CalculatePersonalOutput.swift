//
//  CalculatePersonalOutput.swift
//  iOSCalculateCanadianPersonal
//
//  Created by Mauricio on 4/8/20.
//  Copyright © 2020 ITSCREDIT. All rights reserved.
//

import Foundation

struct CalculatePersonalOutput {
    let calculateId: Int
    let loanAmount: Int
    let loanPayment, interestOverTerm, totalPaymentAmount: Double
    
    init(calculateId: Int = 0, loanAmount: Int = 0, loanPayment: Double = 0.0, interestOverTerm: Double = 0.0, totalPaymentAmount: Double = 0.0) {
        self.calculateId = calculateId
        self.loanAmount = loanAmount
        self.loanPayment = loanPayment
        self.interestOverTerm = interestOverTerm
        self.totalPaymentAmount = totalPaymentAmount
    }
}
