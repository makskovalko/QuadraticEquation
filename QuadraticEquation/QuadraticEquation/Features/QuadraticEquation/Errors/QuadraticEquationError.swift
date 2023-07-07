//
//  QuadraticEquationError.swift
//  QuadraticEquation
//
//  Created by Maxim Kovalko on 7/7/23.
//

import Foundation

enum QuadraticEquationError: Error {
    case noSolution(String)

    var description: String? {
        guard case .noSolution(let description) = self else { return nil }
        return description
    }
}
