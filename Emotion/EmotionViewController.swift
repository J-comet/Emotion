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
    
    enum PullDownMenu:Int, CaseIterable {
        case plus1
        case plus5
        case plus10
        case reset
    }
    
    @IBAction func emotionBtnClicked(_ sender: UIButton) {
        print(EmotionTitle.allCases[sender.tag - 1], "[클릭]")
        //        printClickCnt(tag: sender.tag)
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
        switch tag - 1 {
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
    
    func pullDownAction(button: UIButton, pullDownMenu: PullDownMenu) {

        switch button.tag - 1 {
        case Emotion.happy.rawValue:
            switch pullDownMenu {
            case .plus1: happyCnt += 1
            case .plus5: happyCnt += 5
            case .plus10: happyCnt += 10
            case .reset:  happyCnt = 0
            }
            
        case Emotion.smile.rawValue:
            switch pullDownMenu {
            case .plus1: smileCnt += 1
            case .plus5: smileCnt += 5
            case .plus10: smileCnt += 10
            case .reset: smileCnt = 0
            }
            
        case Emotion.basic.rawValue:
            switch pullDownMenu {
            case .plus1: basicCnt += 1
            case .plus5: basicCnt += 5
            case .plus10: basicCnt += 10
            case .reset: basicCnt = 0
            }
        case Emotion.sad.rawValue:
            switch pullDownMenu {
            case .plus1: sadCnt += 1
            case .plus5: sadCnt += 5
            case .plus10: sadCnt += 10
            case .reset: sadCnt = 0
            }
        case Emotion.dead.rawValue:
            switch pullDownMenu {
            case .plus1: deadCnt += 1
            case .plus5: deadCnt += 5
            case .plus10: deadCnt += 10
            case .reset: deadCnt = 0
            }
        default:
            print("오류")
        }
        
        print(EmotionTitle.happy, "= \(happyCnt)")
        print(EmotionTitle.smile, "= \(smileCnt)")
        print(EmotionTitle.basic, "= \(basicCnt)")
        print(EmotionTitle.sad, "= \(sadCnt)")
        print(EmotionTitle.dead, "= \(deadCnt)")
    }
}
