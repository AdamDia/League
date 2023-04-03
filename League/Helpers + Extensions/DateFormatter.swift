//
//  DateFormatter.swift
//  League
//
//  Created by Adam Essam on 03/04/2023.
//

import Foundation

extension DateFormatter {
    static let hourMinuteFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm a"
            return formatter
        }()
    
    func convertDateString(_ dateString: String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = formatter.date(from: dateString) {
            return DateFormatter.hourMinuteFormatter.string(from: date)
        }
        
        return nil
    }
}
