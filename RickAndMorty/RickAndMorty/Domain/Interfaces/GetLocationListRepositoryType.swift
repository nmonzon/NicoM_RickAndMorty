//
//  GetLocationListRepositoryType.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 13/2/2024.
//

import Foundation

protocol GetLocationListRepositoryType {
    func getLocationList() async -> Result<[LocationItem], HomeDomainError>
}
