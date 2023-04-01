//
//  AgentListResponse.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 30/12/22.
//

import Foundation

// MARK: - Agent

struct Agent: Codable {
    let uuid: String
    let displayName: String
    let description: String
    let bustPortrait, fullPortrait, fullPortraitV2: String?
    let killfeedPortrait: String
    let background: String?
    let backgroundGradientColors: [String]
    let role: Role?
    let abilities: [Ability]
    let isPlayableCharacter: Bool
}

// MARK: - Ability

struct Ability: Codable {
    let slot: Slot
    let abilityName, abilityDescription: String
    let abilityIcon: String?

    enum CodingKeys: String, CodingKey {
        case slot
        case abilityName = "displayName"
        case abilityDescription = "description"
        case abilityIcon = "displayIcon"
    }
}

enum Slot: String, Codable {
    case ability1 = "Ability1"
    case ability2 = "Ability2"
    case grenade = "Grenade"
    case passive = "Passive"
    case ultimate = "Ultimate"
}

// MARK: - Role

struct Role: Codable {
    let displayName: DisplayName
    let roleDescription: String
    let displayIcon: String
    
    enum CodingKeys: String, CodingKey {
        case displayName, displayIcon
        case roleDescription = "description"
    }
}

enum DisplayName: String, Codable {
    case controlador = "Controlador"
    case duelista = "Duelista"
    case iniciador = "Iniciador"
    case sentinela = "Sentinela"
}

extension Agent: Equatable {
    static func == (lhs: Agent, rhs: Agent) -> Bool {
        return lhs.uuid == rhs.uuid &&
               lhs.displayName == rhs.displayName &&
               lhs.fullPortraitV2 == rhs.fullPortraitV2 &&
               lhs.role?.displayName == rhs.role?.displayName
    }
}
