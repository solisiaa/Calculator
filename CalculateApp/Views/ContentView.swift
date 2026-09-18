import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CalculatorViewModel()

    let buttons: [[CalculatorButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equals]
    ]

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 12) {
                Spacer()

                // Экран с результатом
                HStack {
                    Spacer()
                    Text(viewModel.displayValue)
                        .foregroundColor(.white)
                        .font(.system(size: 70))
                        .padding()
                }

                // Кнопки
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { button in
                            Button(action: {
                                viewModel.buttonTapped(button)
                            }) {
                                Text(button.rawValue)
                                    .font(.system(size: 32))
                                    .frame(width: buttonWidth(button), height: 80)
                                    .background(colorFor(button))
                                    .foregroundColor(.white)
                                    .cornerRadius(40)
                            }
                        }
                    }
                }
            }
            .padding(.bottom, 20)
        }
    }

    private func buttonWidth(_ button: CalculatorButton) -> CGFloat {
        button == .zero ? 168 : 78
    }

    private func colorFor(_ button: CalculatorButton) -> Color {
        switch button.backgroundColor {
        case "red": return .red
        case "lightGray": return Color(white: 0.7)
        default: return Color(white: 0.2)
        }
    }
}
