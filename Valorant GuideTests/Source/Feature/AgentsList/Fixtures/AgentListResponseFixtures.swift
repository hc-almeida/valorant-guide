//
//  AgentListResponseFixtures.swift
//  Valorant GuideTests
//
//  Created by Hellen Caroline  on 15/01/23.
//

import Foundation
@testable import Valorant_Guide

extension AgentsListModel.Response {
    static func fixture(
        data: [Agent] = [.fixture()]) -> AgentsListModel.Response {
        AgentsListModel.Response(data: data)
    }
}

extension Agent {
    static func fixture(
        uuid: String = "",
        displayName: String = "",
        description: String = "",
        bustPortrait: String = "",
        fullPortrait: String = "",
        fullPortraitV2: String = "",
        killfeedPortrait: String = "",
        background: String = "",
        backgroundGradientColors: [String] = [],
        role: Role = .fixture(),
        abilities: [Ability] = [.fixture()],
        isPlayableCharacter: Bool = false) -> Agent {
        Agent(uuid: uuid,
              displayName: displayName,
              description: description,
              bustPortrait: bustPortrait,
              fullPortrait: fullPortrait,
              fullPortraitV2: fullPortraitV2,
              killfeedPortrait: killfeedPortrait,
              background: background,
              backgroundGradientColors: backgroundGradientColors,
              role: role,
              abilities: abilities,
              isPlayableCharacter: isPlayableCharacter)
    }
}

extension Role {
    static func fixture(displayName: DisplayName = .duelista,
                        roleDescription: String = "",
                        displayIcon: String = ""
    ) -> Role {
        Role(displayName: displayName,
             roleDescription: roleDescription,
             displayIcon: displayIcon)
    }
}

extension Ability {
    static func fixture(slot: Slot = .ability1,
                        abilityName: String = "",
                        abilityDescription: String = "",
                        abilityIcon: String = ""
    ) -> Ability {
        Ability(slot: slot,
                abilityName: abilityName,
                abilityDescription: abilityDescription,
                abilityIcon: abilityIcon)
    }
}
