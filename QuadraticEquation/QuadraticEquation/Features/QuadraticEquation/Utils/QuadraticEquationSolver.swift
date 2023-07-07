//
//  QuadraticEquationSolver.swift
//  QuadraticEquation
//
//  Created by Maxim Kovalko on 7/7/23.
//

import Foundation
import Models

protocol QuadraticEquationSolverType {
    func solve(coefficients: Coefficients) -> Result<QuadraticEquationResult, QuadraticEquationError>
}

final class QuadraticEquationSolver: QuadraticEquationSolverType {
    func solve(coefficients: Coefficients) -> Result<QuadraticEquationResult, QuadraticEquationError> {
        let (a, b, c) = (coefficients.a, coefficients.b, coefficients.c)
        let discriminant = pow(b, 2) - 4 * a * c

        switch discriminant {
        case _ where discriminant < 0:
            return .failure(.noSolution("No real solutions".localized))
        case _ where discriminant == 0:
            let root = -b / (2 * a)
            return .success(.init(x1: root, x2: root))
        default:
            let sqrtDiscriminant = sqrt(discriminant)
            let root1 = (-b + sqrtDiscriminant) / (2 * a)
            let root2 = (-b - sqrtDiscriminant) / (2 * a)
            return .success(.init(x1: root1, x2: root2))
        }
    }
}
