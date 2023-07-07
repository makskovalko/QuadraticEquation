//
//  QuadraticEquationViewController.swift
//  QuadraticEquation
//
//  Created by Maxim Kovalko on 7/6/23.
//

import Cocoa
import Atributika
import Models

// MARK: - Constants -

private extension QuadraticEquationViewController {
    enum Constants {
        static let supTag = "sup"
        static let sampleQuadraticEquation = String(
            format: "Sample: %@".localized,
            "ax<\(supTag)>2</\(supTag)> + bx + c = 0"
        )
        static let solutions = "Solutions:".localized
        static let ok = "ok".localized.uppercased()
        static let invalidInput = "Invalid Input".localized
        static let invalidValueFor = "Invalid value for %@".localized
        static let calculate = "Calculate".localized
    }
}

// MARK: - QuadraticEquationViewController Implementation -

final class QuadraticEquationViewController: NSViewController {
    @IBOutlet private var aTextField: NSTextField!
    @IBOutlet private var bTextField: NSTextField!
    @IBOutlet private var cTextField: NSTextField!
    @IBOutlet private var sampleTextField: NSTextField!
    @IBOutlet private var resultStackView: NSStackView!
    @IBOutlet private var resultTitleTextField: NSTextField!
    @IBOutlet private var x1ResultTextField: NSTextField!
    @IBOutlet private var x2ResultTextField: NSTextField!
    @IBOutlet private var calculateButton: NSButton!

    private let quadraticEquationSolver: QuadraticEquationSolverType

    init(nibName nibNameOrNil: NSNib.Name?, bundle
         nibBundleOrNil: Bundle?,
         quadraticEquationSolver: QuadraticEquationSolverType
    ) {
        self.quadraticEquationSolver = quadraticEquationSolver
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder: NSCoder) {
        quadraticEquationSolver = QuadraticEquationSolver()
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialUIState()
    }

    @IBAction func solveEquationButtonClicked(_ sender: NSButton) {
        let validationResult = validateTextFields()

        switch validationResult {
        case .success(let result):
            display(
                solution: quadraticEquationSolver.solve(
                    coefficients: .init(
                        a: result.aValue,
                        b: result.bValue,
                        c: result.cValue
                    )
                )
            )
        case .failure(let error):
            error.alertInfo.map(showAlert(alertInfo:))
        }
    }
}

// MARK: - Setup UI -

private extension QuadraticEquationViewController {
    func setupInitialUIState() {
        resultStackView.isHidden = true
        resultTitleTextField.stringValue = Constants.solutions
        sampleTextField.attributedStringValue = {
            let style = Attrs().baselineOffset(8).font(.systemFont(ofSize: 8))
            return Constants
                .sampleQuadraticEquation
                .style(tags: [Constants.supTag: style])
                .attributedString
        }()
        calculateButton.title = Constants.calculate
    }
}

// MARK: - Validation -

private extension QuadraticEquationViewController {
    func validateTextFields() -> Result<ValidationResult, ValidationError> {
        guard let aValue = Double(aTextField.stringValue) else {
            return .failure(error(for: "a"))
        }
        guard let bValue = Double(bTextField.stringValue) else {
            return .failure(error(for: "b"))
        }
        guard let cValue = Double(cTextField.stringValue) else {
            return .failure(error(for: "c"))
        }
        return .success(.init(aValue: aValue, bValue: bValue, cValue: cValue))
    }

    func error(for coefficient: String) -> ValidationError {
        .invalidInput(.init(message: Constants.invalidInput,
                            informativeText: invalidValue(for: coefficient)))
    }

    func invalidValue(for coefficient: String) -> String {
        String(format: Constants.invalidValueFor, coefficient)
    }
}

// MARK: - Display Quadratic Equation Result -

private extension QuadraticEquationViewController {
    func display(solution: Result<QuadraticEquationResult, QuadraticEquationError>) {
        switch solution {
        case .success(let result):
            resultStackView.isHidden = false
            resultTitleTextField.stringValue = Constants.solutions

            let bindings: [(textField: NSTextField, attrString: NSAttributedString)] = [
                (x1ResultTextField, attributedString(for: "1", result: result.x1)),
                (x2ResultTextField, attributedString(for: "2", result: result.x2))
            ]

            bindings.forEach { textField, attrString in
                textField.attributedStringValue = attrString
            }
        case .failure(let error):
            resultStackView.isHidden = true
            resultTitleTextField.stringValue = "\(Constants.solutions) \(error.description ?? "")"
        }
    }

    func attributedString(for value: String, result: Double) -> NSAttributedString {
        let string = "x<\(Constants.supTag)>\(value)</\(Constants.supTag)> = \(result)"
        let style = Attrs().baselineOffset(-4).font(.systemFont(ofSize: 8))
        return string.style(tags: ["\(Constants.supTag)": style]).attributedString
    }
}

// MARK: - Show Alert -

private extension QuadraticEquationViewController {
    func showAlert(alertInfo: AlertInfo) {
        let alert = NSAlert()
        alert.messageText = alertInfo.message
        alert.informativeText = alertInfo.informativeText
        alert.alertStyle = .warning
        alert.addButton(withTitle: Constants.ok)
        alert.runModal()
    }
}
