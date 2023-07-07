//
//  ValidationError.swift
//  QuadraticEquation
//
//  Created by Maxim Kovalko on 7/7/23.
//

import Foundation
import Models

enum ValidationError: Error {
    case invalidInput(AlertInfo)

    var alertInfo: AlertInfo? {
        guard case .invalidInput(let alertInfo) = self else { return nil }
        return alertInfo
    }
}
