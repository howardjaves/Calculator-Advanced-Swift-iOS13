//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Howard Javes on 29/08/2021.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    private var number: Double?
    private var intermediateCalculation: (operation: String, n1: Double)?

    mutating func setNumber(_ number: Double) {
        self.number = number
    }

    mutating func calculate(operation: String) -> Double? {
        if let n = number {
            switch operation {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n / 100
            case "=":
                return performTwoNumberCalculation(n2: n)
            default:
                intermediateCalculation = (operation: operation, n1: n)
                return n
            }
        }

        return nil
    }

    private func performTwoNumberCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.operation {

            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("Unknown operation in performTwoNumberCalculation")
            }
        }

        return nil
    }
}
