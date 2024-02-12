//
//  HomeMenuDatasource.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 11/2/2024.
//

protocol HomeMenuDatasourceType {
    func getHomeMenuDatasourceData() async -> Result<HomeMenuDTO, HTTPClientError>
}
