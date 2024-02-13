//
//  EpisodeListDatasourceType.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

protocol EpisodeListDatasourceType {
    func getEpisodeList() async -> Result<[EpisodeDTO], HTTPClientError>
}
