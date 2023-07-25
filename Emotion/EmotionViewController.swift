//
//  EmotionViewController.swift
//  Emotion
//
//  Created by 장혜성 on 2023/07/25.
//

import UIKit

class EmotionViewController: UIViewController {
    
    @IBOutlet var buttonCollection: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designButton()
        self.navigationItem.title = "OH MY MOOD"
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
