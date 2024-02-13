//
//  GetEpisodeListRepositoryType.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

protocol GetEpisodeListRepositoryType {
    func getEpisodeList() async -> Result<[EpisodeItem], HomeDomainError>
}
