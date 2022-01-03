//
//  Router.swift
//  BMI-Calculator
//
//  Created by Hiroaki-Hirabayashi on 2022/01/02.
//

import UIKit

final class Router {
    var calculatorBrain = CalculatorBrain()

    // アプリ起動時にrootViewを取得する処理
    static func showRoot(window: UIWindow?) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let firstVC = mainStoryboard.instantiateInitialViewController() as! ViewController
        let nav = UINavigationController(rootViewController: firstVC) // ナビゲーションコントローラーを定義。引数で最下層となるViewを指定
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
    
    static func showResult(fromVC: UIViewController){
        let storyboard = UIStoryboard(name: "Result", bundle: nil)
        let resultVC = storyboard.instantiateViewController(withIdentifier: "Result") as! ResultViewController
//        resultVC.color = calculatorBrain.getColor()
        show(fromVC: fromVC, nextVC: resultVC)
    }
    
    // 実際に画面を遷移させる処理
    private static func show(fromVC: UIViewController, nextVC: UIViewController) {
        if let nav = fromVC.navigationController {
            nav.pushViewController(nextVC, animated: true)
        } else {
            fromVC.present(nextVC, animated: true, completion: nil)
        }
    }
}

