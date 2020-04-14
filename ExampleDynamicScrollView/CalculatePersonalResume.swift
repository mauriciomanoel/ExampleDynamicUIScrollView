//
//  CalculatePersonalResume.swift
//  iOSCalculateCanadianPersonal
//
//  Created by Mauricio on 4/3/20.
//  Copyright © 2020 ITSCREDIT. All rights reserved.
//

import UIKit

@IBDesignable
class CalculatePersonalResume: UITableViewCell {

    @IBOutlet weak var loanPaymentOutput: UILabel!
    @IBOutlet weak var loanAmountOutput: UILabel!
    @IBOutlet weak var totalInterestOverTeamOuput: UILabel!
    @IBOutlet weak var totalPaymentAmountOuput: UILabel!
    @IBOutlet weak var compareView: UIView!
    @IBOutlet weak var saveView: UIView!
    @IBOutlet weak var printView: UIView!
    @IBOutlet weak var graphView: UIView!
    @IBOutlet weak var fullPlanView: UIView!
    @IBOutlet weak var compareIcon: UIImageView!
    @IBOutlet weak var saveIcon: UIImageView!
    @IBOutlet weak var printIcon: UIImageView!
    @IBOutlet weak var graphIcon: UIImageView!
    @IBOutlet weak var fullPlanIcon: UIImageView!
    @IBOutlet weak var typeLoanIcon: UIImageView!
    
    @IBOutlet weak var labelResume: UILabel!
    @IBOutlet weak var labelResumeLoanPayment: UILabel!
    @IBOutlet weak var labelResumeLoanAmount: UILabel!
    @IBOutlet weak var labelResumeTotalInterestOverTeam: UILabel!
    @IBOutlet weak var labelResumeTotalPaymentAmount: UILabel!

    @IBOutlet weak var labelCompareIcon: UILabel!
    @IBOutlet weak var labelSaveIcon: UILabel!
    @IBOutlet weak var labelPrintIcon: UILabel!
    @IBOutlet weak var labelGraphIcon: UILabel!
    @IBOutlet weak var labelFullPlanIcon: UILabel!

    var position = 1

    @objc func onClickActionSave() {
        print("onClickActionSave \(position)")

        onClickEventActionCalculateData = .SAVE
    }

    @objc func onClickActionPrint() {
        onClickEventActionCalculateData = .PRINT
    }

    @objc func onClickActionCompare() {
        print("onClickActionCompare \(position)")
        onClickEventActionCalculateData = .COMPARE
    }

    @objc func onClickActionGraph() {
        onClickEventActionCalculateData = .GRAPH
    }

    @objc func onClickActionFullPlan() {
        onClickEventActionCalculateData = .FULL_PLAN
    }
    
    public var onClickEventActionCalculateClosure: ((CalculateOnClickEventActionEnum?)->())?
    private var onClickEventActionCalculateData: CalculateOnClickEventActionEnum? {
        didSet {
            self.onClickEventActionCalculateClosure?(onClickEventActionCalculateData)
        }
    }
    
//    override init(frame aFrame: CGRect) {
//        super.init(frame: aFrame)
//        commomInit()
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        startOnClickEventAction()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //commomInit()
    }
    
    private func commomInit() {
        
        let bundle = Bundle(identifier: "com.itscredit.ExampleDynamicScrollView")
        let nib = UINib(nibName: "CalculatePersonalResume", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(view)
        
        startOnClickEventAction()
    }
    
    func startOnClickEventAction() {
        let tapCompare = UITapGestureRecognizer(target: self, action: #selector(self.onClickActionCompare))
        compareView.addGestureRecognizer(tapCompare)
        compareView.isUserInteractionEnabled = true
        
        let tapSave = UITapGestureRecognizer(target: self, action: #selector(self.onClickActionSave))
        saveView.addGestureRecognizer(tapSave)
        saveView.isUserInteractionEnabled = true
        
//        let tapPrint = UITapGestureRecognizer(target: self, action: #selector(self.onClickActionPrint))
//        printView.addGestureRecognizer(tapPrint)
//        printView.isUserInteractionEnabled = true
//
//        let tapGraph = UITapGestureRecognizer(target: self, action: #selector(self.onClickActionGraph))
//        graphView.addGestureRecognizer(tapGraph)
//        graphView.isUserInteractionEnabled = true
//
//        let tapFullPlan = UITapGestureRecognizer(target: self, action: #selector(self.onClickActionFullPlan))
//        fullPlanView.addGestureRecognizer(tapFullPlan)
//        fullPlanView.isUserInteractionEnabled = true
    }
    
    func updateData(_ data: CalculatePersonalOutput) {
        loanPaymentOutput.text = CalculateFormatUtils.getValueFormatted(value: NSNumber(value: data.loanPayment))
        loanAmountOutput.text = CalculateFormatUtils.getValueFormatted(value: NSNumber(value: data.loanAmount))
        totalInterestOverTeamOuput.text = CalculateFormatUtils.getValueFormatted(value: NSNumber(value: data.interestOverTerm))
        totalPaymentAmountOuput.text = CalculateFormatUtils.getValueFormatted(value: NSNumber(value: data.totalPaymentAmount))
    }

}
