//
//  RetirementCalculatorUITests.swift
//  RetirementCalculatorUITests
//
//  Created by Abdulaziz AlObaili on 26/05/2021.
//

import XCTest

class RetirementCalculatorUITests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        XCTContext.runActivity(named: "screenshot") { activity in
            // UI tests must launch the application that they test.
            let app = XCUIApplication()
            app.launch()

            // Use recording to get started writing UI tests.
            // Use XCTAssert and related functions to verify your tests produce the correct results.
            let monthlyInvestmentsTextField = app.textFields["monthly_investments"]
            monthlyInvestmentsTextField.tap()
            monthlyInvestmentsTextField.typeText("1000")

            let currentAgeTextField = app.textFields["current_age"]
            currentAgeTextField.tap()
            currentAgeTextField.typeText("30")

            let retirementAgeTextField = app.textFields["retirement_age"]
            retirementAgeTextField.tap()
            retirementAgeTextField.typeText("65")

            let interestRateTextField = app.textFields["interest_rate"]
            interestRateTextField.tap()
            interestRateTextField.typeText("4")

            let savingsTextField = app.textFields["savings"]
            savingsTextField.tap()
            savingsTextField.typeText("1000")

            let calculateButton = app.buttons["calculate_retirement"]
            calculateButton.tap()

            let resultLabel = app.staticTexts["result_label"]

            XCTAssertTrue(resultLabel.label.contains("14256"))
        }
    }
}
