# CalculateApp

Простой калькулятор на SwiftUI.

## Что умеет
- Основные операции: `+`, `-`, `×`, `÷`
- `AC` — сброс, `+/-` — смена знака, `%` — проценты
- Десятичный разделитель — запятая `,`
- Тёмная тема в стиле системного калькулятора iOS

## Структура
- `CalculateApp/CalculateAppApp.swift` — точка входа `@main`
- `CalculateApp/Views/ContentView.swift` — интерфейс калькулятора
- `CalculateApp/ViewModels/CalculatorViewModel.swift` — логика вычислений
- `CalculateApp/Models/CalculatorButton.swift` — модель кнопок
- `CalculateApp/Assets.xcassets` — иконка и цвета

## Требования
- Xcode с iOS Simulator SDK 27.0
- iOS 27.0+ (Deployment Target)

## Запуск
1. Открыть `CalculateApp.xcodeproj` в Xcode.
2. Выбрать симулятор iPhone.
3. Нажать `Cmd + R`.
