//
//  EmotionEnum.swift
//  Emotion
//
//  Created by 장혜성 on 2023/07/25.
//

import UIKit

enum Emotion:Int, CaseIterable {
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

enum EmotionTitle: String, CaseIterable {
    case happy = "완전행복지수"
    case smile = "적당미소지수"
    case basic = "그냥그냥지수"
    case sad = "좀속상한지수"
    case dead = "많이슬픈지수"
}

enum EmotionLabelColor: CaseIterable {
    case happy
    case smile
    case basic
    case sad
    case dead
}

extension EmotionLabelColor {
    var value: UIColor {
        get {
            switch self {
            case .happy:
                return .white
            case .smile:
                return .blue
            case .basic:
                return .link
            case .sad:
                return .red
            case .dead:
                return .black
            }
        }
    }
}
