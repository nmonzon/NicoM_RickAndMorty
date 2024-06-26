//
//  HTTPClientType.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 11/2/2024.
//

import Foundation

protocol HTTPClientType {
    func makeRequest(endpoint: Endpoint) async -> Result<Data, HTTPClientError>
}
