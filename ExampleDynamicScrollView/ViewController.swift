//
//  ViewController.swift
//  ExampleDynamicScrollView
//
//  Created by Mauricio on 4/13/20.
//  Copyright © 2020 ITSCREDIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CalculateEventActionDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var heightTableViewConstraint: NSLayoutConstraint!
    
    let heightTable:CGFloat = 365

    var contacts:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightTableViewConstraint.constant = 0
        registerTableViewCells()
    }
    
    func onClickCalculate(event: CalculateOnClickEventActionEnum, calculateId: Int) {
        print("event: \(event) | calculateId: \(calculateId)")
    }
    
    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "CalculatePersonalResumeCompare", bundle: nil)
        self.tableView.register(textFieldCell, forCellReuseIdentifier: "CalculatePersonalResumeCompare")
    }
    
    @IBAction func removeElement(_ sender: Any) {
        heightTableViewConstraint.constant -= heightTable
    }
    
    @IBAction func newElement(_ sender: Any) {
        
        contacts.append("Mauricio")
        tableView.reloadData()
        
        heightTableViewConstraint.constant += heightTable
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        print("\(#function) --- section = \(indexPath.section), row = \(indexPath.row)")
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CalculatePersonalResumeCompare") as? CalculatePersonalResumeCompare {
            cell.delegateAction = self
            return cell
        }
        
        return UITableViewCell()
    }
}

