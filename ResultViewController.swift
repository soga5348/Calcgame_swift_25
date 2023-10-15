//
//  ResultViewController.swift
//  Calcgame2
//
//  Created by soga syunto on 2023/10/14.
//

import UIKit

class ResultViewController: UIViewController {

    var point = 0
    
    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var highestRecordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        recordLabel.text = "あなたの記録 \(point)P"
        
        let highestRecord = UserDefaults.standard.integer(forKey: "record")
        if highestRecord < point {
            UserDefaults.standard.set(point, forKey: "record") // setValueの代わりにsetを使用
            highestRecordLabel.text = "最高記録 \(point)P"
        } else {
            highestRecordLabel.text = "最高記録 \(highestRecord)P"
        }
    }
    
    @IBAction func onBackTop(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
