import Foundation
import Combine

class CalculatorViewModel: ObservableObject {
    @Published var displayValue: String = "0"

    private var currentNumber: Double = 0
    private var previousNumber: Double = 0
    private var currentOperation: CalculatorButton?
    private var isTypingNumber = false

    func buttonTapped(_ button: CalculatorButton) {
        switch button {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            handleNumber(button)
        case .decimal:
            handleDecimal()
        case .plus, .minus, .multiply, .divide:
            handleOperation(button)
        case .equals:
            handleEquals()
        case .clear:
            handleClear()
        case .negative:
            handleNegative()
        case .percent:
            handlePercent()
        }
    }

    private func handleNumber(_ button: CalculatorButton) {
        if isTypingNumber {
            displayValue += button.rawValue
        } else {
            displayValue = button.rawValue
            isTypingNumber = true
        }
    }

    private func handleDecimal() {
        if !displayValue.contains(",") {
            displayValue += ","
        }
    }

    private func handleOperation(_ button: CalculatorButton) {
        previousNumber = Double(displayValue.replacingOccurrences(of: ",", with: ".")) ?? 0
        currentOperation = button
        isTypingNumber = false
    }

    private func handleEquals() {
        currentNumber = Double(displayValue.replacingOccurrences(of: ",", with: ".")) ?? 0
        guard let operation = currentOperation else { return }

        var result: Double = 0
        switch operation {
        case .plus: result = previousNumber + currentNumber
        case .minus: result = previousNumber - currentNumber
        case .multiply: result = previousNumber * currentNumber
        case .divide: result = currentNumber != 0 ? previousNumber / currentNumber : 0
        default: break
        }

        displayValue = formatResult(result)
        currentOperation = nil
        isTypingNumber = false
    }

    private func handleClear() {
        displayValue = "0"
        currentNumber = 0
        previousNumber = 0
        currentOperation = nil
        isTypingNumber = false
    }

    private func handleNegative() {
        if let value = Double(displayValue.replacingOccurrences(of: ",", with: ".")) {
            displayValue = formatResult(value * -1)
        }
    }

    private func handlePercent() {
        if let value = Double(displayValue.replacingOccurrences(of: ",", with: ".")) {
            displayValue = formatResult(value / 100)
        }
    }

    private func formatResult(_ value: Double) -> String {
        if value == value.rounded() && abs(value) < 1e15 {
            return String(format: "%.0f", value)
        }
        return String(value).replacingOccurrences(of: ".", with: ",")
    }
}
