//
//  HomeMenuRepositoryType.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 10/2/2024.
//

import Foundation

protocol HomeMenuRepositoryType {
    func getHomeMenuList() async -> Result<HomeMenu, HomeDomainError>
}
