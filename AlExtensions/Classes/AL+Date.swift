import Foundation

public extension Date {
	
    static var yesterday: Date { return Date().dayBefore }
	
    static var tomorrow: Date { return Date().dayAfter }
	
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
	
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }

    var midnight: Date {
        return Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: self) ?? Date()
    }
    
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self) ?? Date()
    }
    
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    
    var last7day: Date {
        return Calendar.current.date(byAdding: .day, value: -7, to: self) ?? Date()
    }
    
    var lastmonth: Date {
        return Calendar.current.date(byAdding: .month, value: -1, to: self) ?? Date()
    }
    
    var last3month: Date {
        return Calendar.current.date(byAdding: .month, value: -3, to: self) ?? Date()
    }
    
    var last6month: Date {
        return Calendar.current.date(byAdding: .month, value: -6, to: self) ?? Date()
    }
    
    var lastyear: Date {
        return Calendar.current.date(byAdding: .year, value: -1, to: self) ?? Date()
    }
    
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }

    /// Returns formatted date
    func formatted(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }


    /// Init a date with miliseconds
    /// - Parameter milliseconds: Miliseconds 
    init(milliseconds: Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}
