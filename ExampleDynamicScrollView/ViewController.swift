//
//  ViewController.swift
//  ExampleDynamicScrollView
//
//  Created by Mauricio on 4/13/20.
//  Copyright © 2020 ITSCREDIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var update: NSLayoutConstraint!
    
    let imageWidth:CGFloat = 275
    let imageHeight:CGFloat = 364
    var yPosition:CGFloat = 0
    var scrollViewContentSize:CGFloat=0;
    var position = 1
    var a: CGFloat?

//    let contacts:[[String]] = [
//        ["Elon Musk",       "+1-201-3141-5926"],
//        ["Bill Gates",      "+1-202-5358-9793"],
//        ["Tim Cook",        "+1-203-2384-6264"],
//        ["Richard Branson", "+1-204-3383-2795"],
//        ["Jeff Bezos",      "+1-205-0288-4197"],
//        ["Warren Buffet",   "+1-206-1693-9937"],
//        ["The Zuck",        "+1-207-5105-8209"],
//        ["Carlos Slim",     "+1-208-7494-4592"],
//        ["Bill Gates",      "+1-209-3078-1640"],
//        ["Larry Page",      "+1-210-6286-2089"],
//        ["Harold Finch",    "+1-211-9862-8034"],
//        ["Sergey Brin",     "+1-212-8253-4211"],
//        ["Jack Ma",         "+1-213-7067-9821"],
//        ["Steve Ballmer",   "+1-214-4808-6513"],
//        ["Phil Knight",     "+1-215-2823-0664"],
//        ["Paul Allen",      "+1-216-7093-8446"],
//        ["Woz",             "+1-217-0955-0582"]
//    ]
    
    var contacts:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        yPosition = button.frame.origin.y + 100
        scrollViewContentSize = 0
        update.constant = 0
        
        //tableView.isScrollEnabled = false;

        
        registerTableViewCells()
        //update.constant = a!
        
        // Do any additional setup after loading the view.
    }
    
    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "CalculatePersonalResume", bundle: nil)
        self.tableView.register(textFieldCell, forCellReuseIdentifier: "CalculatePersonalResume")
    }
    
    @IBAction func removeElement(_ sender: Any) {
        update.constant -= imageHeight
        
    }
    
    @IBAction func newElement(_ sender: Any) {
        
        contacts.append("Mauricio")
        tableView.reloadData()
        let myImage:UIImage = UIImage(named: "exemple")!
        let myImageView:UIImageView = UIImageView()
        myImageView.image = myImage
        myImageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        myImageView.tag = position
        myImageView.frame.size.width = imageWidth
        myImageView.frame.size.height = imageHeight
        myImageView.center = self.view.center
        myImageView.frame.origin.y = yPosition
        //scrollView.addSubview(myImageView)
        let spacer:CGFloat = 20
        yPosition+=imageHeight + spacer
        scrollViewContentSize+=imageHeight + spacer
        scrollView.contentSize = CGSize(width: imageWidth, height: scrollViewContentSize)
        
        update.constant += imageHeight
        print(scrollViewContentSize)
        position+=1
        
        print("newElement \(yPosition) ")
        print("newElement \(scrollViewContentSize)")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//
        print("\(#function) --- section = \(indexPath.section), row = \(indexPath.row)")
//
//        cell.textLabel?.text = contacts[indexPath.row][0]
//
//        return cell
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CalculatePersonalResume") as? CalculatePersonalResume {
            cell.position = indexPath.row
            return cell
        }
        
        return UITableViewCell()
        
    }

}

