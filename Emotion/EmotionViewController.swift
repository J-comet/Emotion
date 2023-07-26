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
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designButton()
        self.navigationItem.title = "OH MY MOOD"
        
        for i in 0...buttonCollection.count - 1 {
            buttonCollection[i].tag = i + 1
        }
        reloadData()
    }
    
    enum PullDownMenu:Int, CaseIterable {
        case plus1
        case plus5
        case plus10
        case reset
    }
    
    @IBAction func emotionBtnClicked(_ sender: UIButton) {
        print(EmotionTitle.allCases[sender.tag - 1], "[클릭]")
        printClickCnt(tag: sender.tag)
    }
    
    func designButton() {
        for i in 0...buttonCollection.count - 1 {
            buttonCollection[i].setTitle("", for: .normal)
            buttonCollection[i].setImage(UIImage(named: "\(Emotion.allCases[i])"), for: .normal)
            buttonCollection[i].backgroundColor = EmotionBgColor.allCases[i].value
            buttonCollection[i].tintColor = .white
            setPullDownBtn(button: buttonCollection[i])
        }
    }
    
    func setPullDownBtn(button: UIButton) {
        // showsMenuAsPrimaryAction = true 일 때 기존 연결된 클릭액션함수 가로챔
        // showsMenuAsPrimaryAction = false 일 때 길게 누르면 pullDown 버튼 보임
        button.showsMenuAsPrimaryAction = true
        let plus1 = UIAction(title: "+1", image: UIImage(systemName: "plus.square"), handler: { _ in self.pullDownAction(button: button, pullDownMenu: PullDownMenu.plus1) })
        let plus5 = UIAction(title: "+5", image: UIImage(systemName: "plus.square"), handler: { _ in self.pullDownAction(button: button, pullDownMenu: PullDownMenu.plus5) })
        let plus10 = UIAction(title: "+10", image: UIImage(systemName: "plus.square"), handler: { _ in self.pullDownAction(button: button, pullDownMenu: PullDownMenu.plus10) })
        let reset = UIAction(title: "Reset", image: UIImage(systemName: "xmark.square"), handler: { _ in self.pullDownAction(button: button, pullDownMenu: PullDownMenu.reset) })
        button.menu = UIMenu(title: "추가 메뉴",identifier: nil, options: .displayInline, children: [reset,plus10,plus5,plus1])
    }
    
    func printClickCnt(tag: Int) {
        
        guard let value = Emotion(rawValue: tag - 1) else {
            print("오류")
            return
        }
        
        switch value {
        case .happy:
            happyCnt += 1
        case .smile:
            smileCnt += 1
        case .basic:
            basicCnt += 1
        case .sad:
            sadCnt += 1
        case .dead:
            deadCnt += 1
        }
        
        saveEmotionCnt(happyCnt: happyCnt, smileCnt: smileCnt, basicCnt: basicCnt, sadCnt: sadCnt, deadCnt: deadCnt)
        
        print(EmotionTitle.happy, "= \(happyCnt)")
        print(EmotionTitle.smile, "= \(smileCnt)")
        print(EmotionTitle.basic, "= \(basicCnt)")
        print(EmotionTitle.sad, "= \(sadCnt)")
        print(EmotionTitle.dead, "= \(deadCnt)")
    }
    
    func pullDownAction(button: UIButton, pullDownMenu: PullDownMenu) {
        
        guard let value = Emotion(rawValue: button.tag - 1) else {
            print("오류")
            return
        }
        
        switch value {
        case .happy:
            switch pullDownMenu {
            case .plus1: happyCnt += 1
            case .plus5: happyCnt += 5
            case .plus10: happyCnt += 10
            case .reset:  happyCnt = 0
            }
            
        case .smile:
            switch pullDownMenu {
            case .plus1: smileCnt += 1
            case .plus5: smileCnt += 5
            case .plus10: smileCnt += 10
            case .reset: smileCnt = 0
            }
            
        case .basic:
            switch pullDownMenu {
            case .plus1: basicCnt += 1
            case .plus5: basicCnt += 5
            case .plus10: basicCnt += 10
            case .reset: basicCnt = 0
            }
        case .sad:
            switch pullDownMenu {
            case .plus1: sadCnt += 1
            case .plus5: sadCnt += 5
            case .plus10: sadCnt += 10
            case .reset: sadCnt = 0
            }
        case.dead:
            switch pullDownMenu {
            case .plus1: deadCnt += 1
            case .plus5: deadCnt += 5
            case .plus10: deadCnt += 10
            case .reset: deadCnt = 0
            }
        }
        
        saveEmotionCnt(happyCnt: happyCnt, smileCnt: smileCnt, basicCnt: basicCnt, sadCnt: sadCnt, deadCnt: deadCnt)
        
        print(EmotionTitle.happy, "= \(happyCnt)")
        print(EmotionTitle.smile, "= \(smileCnt)")
        print(EmotionTitle.basic, "= \(basicCnt)")
        print(EmotionTitle.sad, "= \(sadCnt)")
        print(EmotionTitle.dead, "= \(deadCnt)")
    }
    
    func saveEmotionCnt(happyCnt: Int, smileCnt: Int, basicCnt: Int, sadCnt: Int, deadCnt: Int) {
        userDefaults.set(happyCnt, forKey: String(describing: EmotionTitle.happy))
        userDefaults.set(smileCnt, forKey: String(describing: EmotionTitle.smile))
        userDefaults.set(basicCnt, forKey: String(describing: EmotionTitle.basic))
        userDefaults.set(sadCnt, forKey: String(describing: EmotionTitle.sad))
        userDefaults.set(deadCnt, forKey: String(describing: EmotionTitle.dead))
    }
    
    func reloadData() {
        print("저장된 데이터 불러오기")
        happyCnt = userDefaults.integer(forKey: String(describing: EmotionTitle.happy))
        smileCnt = userDefaults.integer(forKey: String(describing: EmotionTitle.smile))
        basicCnt = userDefaults.integer(forKey: String(describing: EmotionTitle.basic))
        sadCnt = userDefaults.integer(forKey: String(describing: EmotionTitle.sad))
        deadCnt = userDefaults.integer(forKey: String(describing: EmotionTitle.dead))
    }
    
}
