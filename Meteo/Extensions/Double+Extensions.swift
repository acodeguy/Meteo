import Foundation

extension Double {
    func toFahrenheit() -> Double {
        return Measurement(value: self, unit: UnitTemperature.celsius).converted(to: .fahrenheit).value
    }
}
