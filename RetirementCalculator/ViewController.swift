//
//  ViewController.swift
//  RetirementCalculator
//
//  Created by Abdulaziz AlObaili on 26/05/2021.
//

import AppCenterAnalytics
import AppCenterCrashes
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var monthlyInvestmentsTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var retirementAgeTextField: UITextField!
    @IBOutlet weak var interestRateTextField: UITextField!
    @IBOutlet weak var savingsTextFields: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if Crashes.hasCrashedInLastSession {
            let alert = UIAlertController(
                title: "Sorry about that",
                message: "An error occured that caused a crash.",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "It's OK", style: .default))
            show(alert, sender: self)
        }

        Analytics.trackEvent(.navigatedToCalculator)
    }

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        guard
            let currentAge = Int(ageTextField.text!),
            let plannedRetirementAge = Int(retirementAgeTextField.text!),
            let monthlyInvestment = Float(monthlyInvestmentsTextField.text!),
            let currentSavings = Float(savingsTextFields.text!),
            let interestRate = Float(interestRateTextField.text!)
        else {
            return
        }

        resultLabel.text = "If you save $\(monthlyInvestment) every month for \(plannedRetirementAge - currentAge) years, and invest your current money plus your current investment of \(currentSavings) at a \(interestRate)% annual interest rate, you will save $X by the time you are \(plannedRetirementAge)."

        let properties: [Analytics.Property: String] = [
            .currentAge: String(currentAge),
            .plannedRetirementAge: String(plannedRetirementAge)
        ]

        Analytics.trackEvent(.calculateRetirementAmout, withProperties: properties)
    }
}
