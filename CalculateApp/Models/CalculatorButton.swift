import Foundation

enum CalculatorButton: String {
    case zero = "0", one = "1", two = "2", three = "3", four = "4"
    case five = "5", six = "6", seven = "7", eight = "8", nine = "9"
    case decimal = ","
    case equals = "="
    case plus = "+", minus = "-", multiply = "×", divide = "÷"
    case clear = "AC"
    case negative = "+/-"
    case percent = "%"

    // Цвет кнопки
    var backgroundColor: String {
        switch self {
        case .clear, .negative, .percent:
            return "lightGray"
        case .divide, .multiply, .minus, .plus, .equals:
            return "orange"
        default:
            return "darkGray"
        }
    }
}
