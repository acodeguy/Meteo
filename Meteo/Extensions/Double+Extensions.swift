import Foundation

extension Double {
    func toFahrenheit() -> Double {
        let fahrenheit = Measurement(value: self, unit: UnitTemperature.celsius).converted(to: .fahrenheit).value
        
        return fahrenheit.rounded()
    }
}
