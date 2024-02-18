//
//  String+Extensions.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 17/2/2024.
//

import Foundation

extension String {
    func shortFormattedString() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        guard let date = dateFormatter.date(from: self) else {
            return nil
        }
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
    
}
