//
//  CalculatePersonalResume.swift
//  iOSCalculateCanadianPersonal
//
//  Created by Mauricio on 4/3/20.
//  Copyright © 2020 ITSCREDIT. All rights reserved.
//

import UIKit

@IBDesignable
class CalculatePersonalResumeCompare: UITableViewCell {

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

    var simulationOutput: CalculatePersonalOutput?
    
    weak var delegateAction: CalculateEventActionDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        updateImages()
        startOnClickEventAction()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateImages() {
                
        let resourcePath = Bundle.main.resourcePath!
        compareIcon.image = UIImage(contentsOfFile: URL(fileURLWithPath: resourcePath).appendingPathComponent("ic_calculate_compare.png").path)
        saveIcon.image = UIImage(contentsOfFile: URL(fileURLWithPath: resourcePath).appendingPathComponent("ic_calculate_save.png").path)
        printIcon.image = UIImage(contentsOfFile: URL(fileURLWithPath: resourcePath).appendingPathComponent("ic_calculate_print.png").path)
        graphIcon.image = UIImage(contentsOfFile: URL(fileURLWithPath: resourcePath).appendingPathComponent("ic_calculate_graph.png").path)
        fullPlanIcon.image = UIImage(contentsOfFile: URL(fileURLWithPath: resourcePath).appendingPathComponent("ic_calculate_fullpan.png").path)
        typeLoanIcon.image = UIImage(contentsOfFile: URL(fileURLWithPath: resourcePath).appendingPathComponent("ic_calculate_type_loan_personal.png").path)
    }
    
    func startOnClickEventAction() {
        let tapCompare = UITapGestureRecognizer(target: self, action: #selector(self.onClickActionCompare))
        compareView.addGestureRecognizer(tapCompare)
        compareView.isUserInteractionEnabled = true
        
        let tapSave = UITapGestureRecognizer(target: self, action: #selector(self.onClickActionSave))
        saveView.addGestureRecognizer(tapSave)
        saveView.isUserInteractionEnabled = true
        
        let tapPrint = UITapGestureRecognizer(target: self, action: #selector(self.onClickActionPrint))
        printView.addGestureRecognizer(tapPrint)
        printView.isUserInteractionEnabled = true

        let tapGraph = UITapGestureRecognizer(target: self, action: #selector(self.onClickActionGraph))
        graphView.addGestureRecognizer(tapGraph)
        graphView.isUserInteractionEnabled = true

        let tapFullPlan = UITapGestureRecognizer(target: self, action: #selector(self.onClickActionFullPlan))
        fullPlanView.addGestureRecognizer(tapFullPlan)
        fullPlanView.isUserInteractionEnabled = true
    }
    
    @objc func onClickActionSave() {
        if let calculateId = simulationOutput?.calculateId {
            delegateAction?.onClickCalculate(event: .SAVE, calculateId: calculateId)
        }
    }

    @objc func onClickActionPrint() {
        if let calculateId = simulationOutput?.calculateId {
            delegateAction?.onClickCalculate(event: .PRINT, calculateId: calculateId)
        }
    }

    @objc func onClickActionCompare() {
        if let calculateId = simulationOutput?.calculateId {
            delegateAction?.onClickCalculate(event: .COMPARE, calculateId: calculateId)
        }
    }

    @objc func onClickActionGraph() {
        if let calculateId = simulationOutput?.calculateId {
            delegateAction?.onClickCalculate(event: .GRAPH, calculateId: calculateId)
        }
    }

    @objc func onClickActionFullPlan() {
        if let calculateId = simulationOutput?.calculateId {
            delegateAction?.onClickCalculate(event: .FULL_PLAN, calculateId: calculateId)
        }
    }
    
    func updateData() {
        if let data = simulationOutput {
            loanPaymentOutput.text = CalculateFormatUtils.getValueFormatted(value: NSNumber(value: data.loanPayment))
            loanAmountOutput.text = CalculateFormatUtils.getValueFormatted(value: NSNumber(value: data.loanAmount))
            totalInterestOverTeamOuput.text = CalculateFormatUtils.getValueFormatted(value: NSNumber(value: data.interestOverTerm))
            totalPaymentAmountOuput.text = CalculateFormatUtils.getValueFormatted(value: NSNumber(value: data.totalPaymentAmount))
        }
    }
}
