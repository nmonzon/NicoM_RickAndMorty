//
//  Foundation+Extensions.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 11/2/2024.
//

import Foundation

extension Result {
    var failureValue: Error? {
        switch self {
        case .failure(let error):
            return error
        case .success:
            return nil
        }
    }
}
