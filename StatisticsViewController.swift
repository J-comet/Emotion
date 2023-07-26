//
//  StatisticsViewController.swift
//  Emotion
//
//  Created by 장혜성 on 2023/07/25.
//

import UIKit

class StatisticsViewController: UIViewController {

    @IBOutlet var emotionScoreLabel: [UILabel]!
    @IBOutlet var emotionTitleLabel: [UILabel]!
    @IBOutlet var containerViewCollection: [UIView]!
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "OH MY MOOD"
        
        designContainer()
        setEmotionTitle()
        setLabelColor()
        
        for label in emotionScoreLabel {
            label.text = "0점"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reloadData()
    }

    func designContainer() {
        for i in 0...containerViewCollection.count - 1 {
            containerViewCollection[i].layer.cornerRadius = 8
            containerViewCollection[i].backgroundColor = EmotionBgColor.allCases[i].value
        }
    }
    
    func setEmotionTitle() {
        for i in 0...emotionTitleLabel.count - 1 {
            emotionTitleLabel[i].text = EmotionTitle.allCases[i].rawValue
        }
    }
    
    func setLabelColor() {
        for i in 0...emotionTitleLabel.count - 1 {
            emotionTitleLabel[i].textColor = EmotionLabelColor.allCases[i].value
            emotionScoreLabel[i].textColor = EmotionLabelColor.allCases[i].value
        }
    }
    
    func reloadData() {
        print("저장된 데이터 불러오기")
        for i in 0...emotionScoreLabel.count - 1 {
//            print(Emotion(rawValue: i), "감정")
            if let value = Emotion(rawValue: i) {
                let score = userDefaults.integer(forKey: String(describing: value))
                emotionScoreLabel[i].text = "\(score)점"
            }
        }
    }
}
