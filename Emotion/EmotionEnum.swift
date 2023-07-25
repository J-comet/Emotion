//
//  EmotionEnum.swift
//  Emotion
//
//  Created by 장혜성 on 2023/07/25.
//

import UIKit

enum Emotion: CaseIterable {
    case happy
    case smile
    case basic
    case sad
    case dead
}

enum EmotionBgColor: CaseIterable {
    case happy
    case smile
    case basic
    case sad
    case dead
}

extension EmotionBgColor {
    var value: UIColor {
        get {
            switch self {
            case .happy:
                return .systemPink
            case .smile:
                return .systemOrange
            case .basic:
                return .systemYellow
            case .sad:
                return .systemMint
            case .dead:
                return .systemCyan
            }
    
        }
    }
}
