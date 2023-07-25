//
//  EmotionViewController.swift
//  Emotion
//
//  Created by 장혜성 on 2023/07/25.
//

import UIKit

class EmotionViewController: UIViewController {
    
    @IBOutlet var buttonCollection: [UIButton]!
    
    var happyCnt = 0
    var smileCnt = 0
    var basicCnt = 0
    var sadCnt = 0
    var deadCnt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designButton()
        self.navigationItem.title = "OH MY MOOD"
        
        for i in 0...buttonCollection.count - 1 {
            buttonCollection[i].tag = i + 1
        }
    }
    
    @IBAction func emotionBtnClicked(_ sender: UIButton) {
        print(EmotionTitle.allCases[sender.tag - 1], "[클릭]")
        
        switch sender.tag - 1 {
            case Emotion.happy.rawValue:
                happyCnt += 1
            case Emotion.smile.rawValue:
                smileCnt += 1
            case Emotion.basic.rawValue:
                basicCnt += 1
            case Emotion.sad.rawValue:
                sadCnt += 1
            case Emotion.dead.rawValue:
                deadCnt += 1
            default:
                print("오류")
            }
        print(EmotionTitle.happy, "= \(happyCnt)")
        print(EmotionTitle.smile, "= \(smileCnt)")
        print(EmotionTitle.basic, "= \(basicCnt)")
        print(EmotionTitle.sad, "= \(sadCnt)")
        print(EmotionTitle.dead, "= \(deadCnt)")
    }
    
    func designButton() {
        for i in 0...buttonCollection.count - 1 {
            buttonCollection[i].setTitle("", for: .normal)
            buttonCollection[i].setImage(UIImage(named: "\(Emotion.allCases[i])"), for: .normal)
            buttonCollection[i].backgroundColor = EmotionBgColor.allCases[i].value
            buttonCollection[i].tintColor = .white
        }
    }
    
}
