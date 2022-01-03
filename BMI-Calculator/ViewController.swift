//
//  ViewController.swift
//  BMI-Calculator
//
//  Created by Hiroaki-Hirabayashi on 2022/01/02.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var heightLabel: UILabel!
    @IBOutlet private weak var weightLabel: UILabel!
    @IBOutlet private weak var heightSlider: UISlider!
    @IBOutlet private weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.1f", sender.value)
        heightLabel.text = "\(height)cm"
    }
    
    @IBAction private func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.1f", sender.value)
        weightLabel.text = "\(weight)Kg"
    }
   
    @IBAction private func calculatePressed(_ sender: UISlider) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        let storyboard = UIStoryboard(name: "Result", bundle: nil)
        let resultVC = storyboard.instantiateViewController(withIdentifier: "Result") as! ResultViewController
        
        resultVC.bmiValue = calculatorBrain.getBMIValue()
        resultVC.advice = calculatorBrain.getAdvice()
        resultVC.color = calculatorBrain.getColor()

        self.present(resultVC, animated: true, completion: nil)
//        Router.showResult(fromVC: self)
    }
    
    
}

