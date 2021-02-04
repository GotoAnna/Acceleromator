//
//  ResultViewController.swift
//  Acceleromator
//
//  Created by Mac on 2021/02/04.
//

import UIKit

class ResultViewController: UIViewController {

    //iPhoneの傾きを表示する変数とラベル
    var accelerationX: Double!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let result: Double = fabs(accelerationX*100) //fabs:絶対値
        label.text = String(format: "%.1f˚", result) //"˚":「option + k」
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
