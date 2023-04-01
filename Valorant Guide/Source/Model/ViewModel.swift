//
//  ViewModel.swift
//  ValorantGuide
//
//  Created by Hellen Caroline  on 13/12/22.
//

import Foundation
import UIKit

struct CardViewModel {
    var name: String?
    var subtitle: String?
    var personagemImage: String?
    var backgroundGradientColors: [UIColor]?
}

var CardData = [    
    CardViewModel(name: "RAZE", subtitle: "Duelista", personagemImage: "raze", backgroundGradientColors: [UIColor(rgb: 0xFEAC45), UIColor(rgb: 0xAA8A49), UIColor(rgb: 0x4F1413), UIColor(rgb: 0x2B474B)]),
    CardViewModel(name: "NEON", subtitle: "Duelista", personagemImage: "neon", backgroundGradientColors: [UIColor(rgb: 0xba89ffff), UIColor(rgb: 0xAA8A49), UIColor(rgb: 0x4F1413), UIColor(rgb: 0x2c4799ff)]),
    CardViewModel(name: "KAY", subtitle: "Suporte", personagemImage: "kay", backgroundGradientColors: [UIColor(rgb: 0x4AFAFF), UIColor(rgb: 0x4DA6E1), UIColor(rgb: 0x1A1E4B), UIColor(rgb: 0x391a61ff)]),
    CardViewModel(name: "SKYE", subtitle: "Inibidor", personagemImage: "skye", backgroundGradientColors: [UIColor(rgb: 0x94E789), UIColor(rgb: 0xAA8A49), UIColor(rgb: 0x4F1413), UIColor(rgb: 0x314D48)]),
    CardViewModel(name: "NEON", subtitle: "Duelista", personagemImage: "neon", backgroundGradientColors: [UIColor(rgb: 0x94E789), UIColor(rgb: 0xAA8A49), UIColor(rgb: 0x4F1413), UIColor(rgb: 0x314D48)]),
    CardViewModel(name: "KAY", subtitle: "Suporte", personagemImage: "kay", backgroundGradientColors: [UIColor(rgb: 0x4AFAFF), UIColor(rgb: 0x4DA6E1), UIColor(rgb: 0x1A1E4B), UIColor(rgb: 0x391a61ff)]),
    CardViewModel(name: "SKYE", subtitle: "Inibidor", personagemImage: "skye", backgroundGradientColors: [UIColor(rgb: 0x94E789), UIColor(rgb: 0xAA8A49), UIColor(rgb: 0x4F1413), UIColor(rgb: 0x314D48)])
]

