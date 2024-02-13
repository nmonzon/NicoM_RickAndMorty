//
//  LocationListDatasourceType.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 13/2/2024.
//

import Foundation

protocol LocationListDatasourceType {
    func getLocationList() async -> Result<[LocationInfoDTO], HTTPClientError>
}
