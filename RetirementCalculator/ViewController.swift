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
            let plannedRetirementAge = Int(retirementAgeTextField.text!)
        else {
            return
        }

        let properties: [Analytics.Property: String] = [
            .currentAge: String(currentAge),
            .plannedRetirementAge: String(plannedRetirementAge)
        ]

        Analytics.trackEvent(.calculateRetirementAmout, withProperties: properties)
    }
}
