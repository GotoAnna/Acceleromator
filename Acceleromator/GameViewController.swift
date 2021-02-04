//
//  GameViewController.swift
//  Acceleromator
//
//  Created by Mac on 2021/02/04.
//

import UIKit
import CoreMotion //加速度センサー

class GameViewController: UIViewController {

    @IBOutlet var awaImageView: UIImageView!
    let motionManager = CMMotionManager()
    var accelerationX: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //加速度センサーで取得した情報を処理するコード
        if motionManager.isAccelerometerAvailable{ //加速度計が使用できる状態だったら
            motionManager.accelerometerUpdateInterval = 0.01 //加速度の取得感覚を設定
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!) //加速度計が行使された時に呼ばれる
            {
                data, error in
                //現在の加速度を取得し, その値に基づきawaImageViewの座標を更新
                self.accelerationX = (data?.acceleration.x)!
                self.awaImageView.center.x += CGFloat(self.accelerationX*20)
                
                //awaImageViewが水平器からはみ出してはいけないのでX座標の限界を設定する
                if self.awaImageView.frame.origin.x < 40
                {
                    self.awaImageView.frame.origin.x = 40
                }
                
                if self.awaImageView.frame.origin.x > 260
                {
                    self.awaImageView.frame.origin.x = 260
                }
            }
        }
    }
    
    
    //画面遷移時にaccelerationXの値をResultViewControllerに渡すコード
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        //segue：ViewController同士を接続し,画面遷移を行うための部品
        //resultViewにアクセス
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        
        resultViewController.accelerationX = self.accelerationX //resultに値を渡す
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
