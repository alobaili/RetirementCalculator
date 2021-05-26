//
//  Analytics+Event.swift
//  RetirementCalculator
//
//  Created by Abdulaziz AlObaili on 26/05/2021.
//

import AppCenterAnalytics

extension Analytics {
    enum Event: String {
        case calculateRetirementAmout = "calculate_retirement_amount"
        case navigatedToCalculator = "navigated_to_calculator"
    }

    enum Property: String {
        case currentAge = "current_age"
        case plannedRetirementAge = "planned_retirement_age"
    }

    static func trackEvent(_ event: Event, withProperties properties: [Property: String]? = nil) {
        var eventProperties: [String: String]? = [:]

        if let properties = properties {
            eventProperties = [:]

            properties.forEach { (key, value) in
                eventProperties?[key.rawValue] = value
            }
        }

        trackEvent(event.rawValue, withProperties: eventProperties)
    }
}
