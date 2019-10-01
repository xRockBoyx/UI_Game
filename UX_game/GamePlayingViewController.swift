//
//  GamePlayingViewController.swift
//  iOSClub
//
//  Created by 黃威愷 on 2019/7/5.
//  Copyright © 2019 FCUiosclub. All rights reserved.
//

import UIKit

class GamePlayingViewController: UIViewController {
    @IBOutlet weak var StackOutlet: UIStackView!
    
    var Questions:[Quiz] = [Quiz(name:"Google",description: "字母的顏色錯了",randNum: Int.random(in: 0...1)),Quiz(name:"百事",description: "紅藍傻傻分不清",randNum: Int.random(in: 0...1)),Quiz(name: "Windows",description: "想不到吧～顏色對調啦！",randNum: Int.random(in: 0...1)),Quiz(name:"Nestle",description: "鳥只有兩隻啦",randNum: Int.random(in: 0...1)),Quiz(name:"BMW",description: "藍白顏色對調了",randNum: Int.random(in: 0...1)),Quiz(name:"mutella",description: "紅黑顏色要分清楚喔！",randNum: Int.random(in: 0...1)),Quiz(name: "TESLA", description: "Ｓ上半部沒有缺口喔！",randNum: Int.random(in: 0...1)),Quiz(name: "大金", description: "用大金，省大金", randNum: Int.random(in: 0...1)),Quiz(name: "台中市政府", description: "人在台中多少要懂一下吧～", randNum: Int.random(in: 0...1)),Quiz(name: "全家", description: "全家就是你家", randNum: Int.random(in: 0...1)),Quiz(name: "菲哥與小佛", description: "答錯代表你沒童年", randNum: Int.random(in: 0...1)),Quiz(name: "奧運", description: "2020東京奧運快到囉", randNum: Int.random(in: 0...1)),Quiz(name: "達美樂", description: "餓爸爸餓-我餓我餓", randNum: Int.random(in: 0...1)),Quiz(name: "韓國", description: "小心韓粉", randNum: Int.random(in: 0...1)),Quiz(name: "AppStore", description: "如果你是用iPhone還答錯代表信仰不足", randNum: Int.random(in: 0...1)),Quiz(name: "MasterCard", description: "快滿20歲可以辦卡了", randNum: Int.random(in: 0...1)),Quiz(name: "PlayStation", description: "別跟我說你沒玩(看)過", randNum: Int.random(in: 0...1)),Quiz(name: "porsche", description: "爸爸我也想要一台保時捷", randNum: Int.random(in: 0...1)),Quiz(name: "puma", description: "這隻到底是老虎還是豹？", randNum: Int.random(in: 0...1)),Quiz(name: "python", description: "是資訊系還答錯就給我來茶會老子當面教你", randNum: Int.random(in: 0...1)),Quiz(name: "大苑子", description: "芒果冰沙超讚", randNum: Int.random(in: 0...1)),Quiz(name: "抖音", description: "是八分音符啦", randNum: Int.random(in: 0...1)),Quiz(name: "逢甲", description: "讀逢甲還敢答錯啊", randNum: Int.random(in: 0...1)),Quiz(name: "amazon", description: "多逛逛網拍吧～", randNum: Int.random(in: 0...1)),Quiz(name: "apple", description: "葉子錯邊囉～", randNum: Int.random(in: 0...1)),Quiz(name: "BurgerKing", description: "漢堡光澤錯邊了～", randNum: Int.random(in: 0...1)),Quiz(name: "chrome", description: "真的是明顯到不行", randNum: Int.random(in: 0...1)),Quiz(name: "Google_Drive", description: "想看看我的3TB嗎", randNum: Int.random(in: 0...1)),Quiz(name: "KFC", description: "圍裙上是三條白線喔～", randNum: Int.random(in: 0...1)),Quiz(name: "LINE", description: "送分題啦", randNum: Int.random(in: 0...1)),Quiz(name: "NBA", description: "我愛林書豪", randNum: Int.random(in: 0...1)),Quiz(name: "Safari", description: "這是MAC才有的網頁瀏覽器喔～", randNum: Int.random(in: 0...1)),Quiz(name: "soundcloud", description: "這我也不知道是啥", randNum: Int.random(in: 0...1)),Quiz(name: "StarOfLife", description: "在馬路上要禮讓救護車喔～", randNum: Int.random(in: 0...1)),Quiz(name: "volkswagen", description: "考到駕照了嗎？", randNum: Int.random(in: 0...1)),Quiz(name: "yahoo", description: "左邊高還是右邊高呢？", randNum: Int.random(in: 0...1)),Quiz(name: "youtube", description: "圓角稜角差很大喔～", randNum: Int.random(in: 0...1))]
    
    var index = 0
    var backgroundWrong = UIColor(displayP3Red: 255, green: 0, blue: 0, alpha: 1.0)
    var backgroundRight = UIColor(displayP3Red: 0, green: 255, blue: 0, alpha: 1.0)
    var WeatherUserIsRight = false
    var score = 0
    var QuestionCount = 0
    var choosed = 0
    var presscount = 0
    @IBOutlet weak var AnswerImageRightBackground: UIView!
    @IBOutlet weak var AnswerImageLeftBackground: UIView!
    @IBOutlet weak var AfterAnswerLabel: UILabel!
    @IBOutlet weak var AnswerImageLeft: UIImageView!
    @IBOutlet weak var AnswerImageRight: UIImageView!
    @IBOutlet weak var OutcomeImageLeft: UIImageView!
    @IBOutlet weak var OutcomeImageRight: UIImageView!
    let duration = 0.8
    let durationOffset = -0.3
    
    @IBOutlet weak var ScoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Questions.count)
        let width = UIScreen.main.bounds.width
        print(width)
        choosed = 0
        presscount = 0
        ScoreLabel.text = "分數: " + String(score)
        
        index = Int.random(in: 0...Questions.count-1)
        while Questions[index].Flag == 1 {
            index = Int.random(in: 0...Questions.count-1)
        }
        SetQuestions(quiz: Questions[index])
        
        AnswerImageLeftBackground.backgroundColor = .white
        AnswerImageRightBackground.backgroundColor = .white
        OutcomeImageLeft.isHidden = true
        OutcomeImageRight.isHidden = true
        AfterAnswerLabel.isHidden = true
        // Do any additional setup after loading the view.
    }
    @IBAction func ExitButton(_ sender: Any) {
        
        exit(0)
    }
    @IBAction func RefreshButton(_ sender: Any) {
        if choosed == 0{
            let Action = UIAlertAction(title: "OK", style: .default, handler: nil)
            let Alert = UIAlertController(title: "等等！", message: "你還沒答題啊", preferredStyle: .alert)
            Alert.addAction(Action)
            present(Alert, animated: true, completion: nil)
        }else{
            QuestionCount += 1
            if QuestionCount == 10{
                ToEndgameView()
            }
            self.viewDidLoad()
        }
        
    }
    func ToEndgameView(){
        let DisVC = storyboard?.instantiateViewController(withIdentifier: "EndGame") as! GameFinishViewController
        DisVC.data = String(score)
        score = 0
        QuestionCount = 0
        for i in Questions{
            i.SetFlagToUnusd()
        }
        present(DisVC, animated: true,completion: nil)
    }
    
    @IBAction func CorrectOrIncorrectJudge1(_ sender: UITapGestureRecognizer) {
        sender.numberOfTapsRequired = 1
        sender.numberOfTouchesRequired = 1
        presscount += 1
        
        
        if(Questions[index].Name[0].contains("真")){
            OutcomeImageLeft.image = UIImage(named: "答對圖片")
            UIView.animate(withDuration: duration, animations: {() -> Void in
                self.AnswerImageLeftBackground.backgroundColor = self.backgroundRight
            })
            OutcomeImageRight.image = UIImage(named: "答錯圖片")
            UIView.animate(withDuration: duration - durationOffset, animations: {() -> Void in
                self.AnswerImageRightBackground.backgroundColor = self.backgroundWrong
            })
            WeatherUserIsRight = false
        }else{
            OutcomeImageLeft.image = UIImage(named: "答錯圖片")
            UIView.animate(withDuration: duration - durationOffset, animations: {() -> Void in
                self.AnswerImageLeftBackground.backgroundColor = self.backgroundWrong
            })
            OutcomeImageRight.image = UIImage(named: "答對圖片")
            UIView.animate(withDuration: duration, animations: {() -> Void in
                self.AnswerImageRightBackground.backgroundColor = self.backgroundRight
            })
            WeatherUserIsRight = true
        }
        if WeatherUserIsRight && choosed == 0 && presscount == 1{
            choosed = 1
            score += 100
        }else if !WeatherUserIsRight && choosed == 0 && presscount == 1{
            choosed = 1
        }
        ScoreLabel.text = "分數: " + String(score)
        OutcomeImageRight.isHidden = false
        OutcomeImageLeft.isHidden = false
        AfterAnswerLabel.isHidden = false
    }
    @IBAction func CorrectOrIncorrectJudge(_ sender: UITapGestureRecognizer) {
        sender.numberOfTapsRequired = 1
        sender.numberOfTouchesRequired = 1
        presscount += 1
        
        if(Questions[index].Name[0].contains("真")){
            OutcomeImageLeft.image = UIImage(named: "答對圖片")
            UIView.animate(withDuration: duration, animations: {() -> Void in
                self.AnswerImageLeftBackground.backgroundColor = self.backgroundRight
            })
            OutcomeImageRight.image = UIImage(named: "答錯圖片")
            UIView.animate(withDuration: duration - durationOffset, animations: {() -> Void in
                self.AnswerImageRightBackground.backgroundColor = self.backgroundWrong
            })
            WeatherUserIsRight = true
        }else{
            OutcomeImageLeft.image = UIImage(named: "答錯圖片")
            UIView.animate(withDuration: duration - durationOffset, animations: {() -> Void in
                self.AnswerImageLeftBackground.backgroundColor = self.backgroundWrong
            })
            OutcomeImageRight.image = UIImage(named: "答對圖片")
            UIView.animate(withDuration: duration, animations: {() -> Void in
                self.AnswerImageRightBackground.backgroundColor = self.backgroundRight
            })
            WeatherUserIsRight = false
        }
        if WeatherUserIsRight && choosed == 0 && presscount == 1{
            choosed = 1
            score += 100
        }else if !WeatherUserIsRight && choosed == 0 && presscount == 1{
            choosed = 1
        }
        ScoreLabel.text = "分數: " + String(score)
        OutcomeImageRight.isHidden = false
        OutcomeImageLeft.isHidden = false
        AfterAnswerLabel.isHidden = false
    }
    func SetQuestions(quiz:Quiz){
        AfterAnswerLabel.text = quiz.Description
        AfterAnswerLabel.sizeToFit()
        AnswerImageLeft.image = UIImage(named: quiz.Name[0])
        AnswerImageRight.image = UIImage(named: quiz.Name[1])
        quiz.SetFlagToUsed()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
