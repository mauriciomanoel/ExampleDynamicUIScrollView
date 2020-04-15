//
//  CalculateDelegate.swift
//  iOSCalculateCanadianPersonal
//
//  Created by Mauricio on 4/1/20.
//  Copyright © 2020 ITSCREDIT. All rights reserved.
//

protocol CalculateEventActionDelegate: class {
    func onClickCalculate(event: CalculateOnClickEventActionEnum, calculateId: Int)
}
