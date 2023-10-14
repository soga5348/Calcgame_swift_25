//
//  CalcViewController.swift
//  Calcgame2
//
//  Created by soga syunto on 2023/10/12.
//

import UIKit

class CalcViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    var answer = 0
    var point = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        makeNewQuestion()
        setButtonTitle()
        
        button1.addTarget(self,action: #selector(onButton(_:)), for: .touchUpInside)
        button2.addTarget(self,action: #selector(onButton(_:)), for: .touchUpInside)
        button3.addTarget(self,action: #selector(onButton(_:)), for: .touchUpInside)
        button4.addTarget(self,action: #selector(onButton(_:)), for: .touchUpInside)
    }
    
    @objc func onButton(_ sender: UIButton) {
        let input = Int(sender.currentTitle!)
        if input == answer {
            point += 10
            resultLabel.text = "前回の問題 : 正解"
        } else {
            point -= 10
            resultLabel.text = "前回の問題 : 不正解"
        }
        
        // 新しい問題を生成し、ボタンのタイトルを再設定する
        makeNewQuestion()
        setButtonTitle()
    }

    
    
    
    
    func makeNewQuestion(){
        let num1 = Int.random(in:0...9)
        let num2 = Int.random(in:0...9)
        questionLabel.text = "\(num1) + \(num2) ="
        answer = num1 + num2
    }
    
    func setButtonTitle(){
        var answerList = [answer]
        while answerList.count < 4{
            let randomAnswer = Int.random(in:0...18)
            if !answerList.contains(randomAnswer){
                answerList.append(randomAnswer)
            }
        
    }
        answerList.shuffle()
        button1.setTitle(String(answerList[0]), for: .normal)
        button2.setTitle(String(answerList[1]), for: .normal)
        button3.setTitle(String(answerList[2]), for: .normal)
        button4.setTitle(String(answerList[3]), for: .normal)
    
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