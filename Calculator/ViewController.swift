//
//  ViewController.swift
//  Auto Layout Calculator
//
//  Created by Tyler Campbell on 5/20/19.
//  Copyright © 2019 Tye Campbell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calcScreenView: UILabel!
    
    var currentViewValue = ""
    var decimalUsed = 5
    var currentCalcValue : Float = 0
    var plusNegBtn = false
    var firstValue = ""
    var secondValue = ""
//    var firstValue : Float = 0
//    var secondValue : Float = 0
    var mathOperator = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        clearCalcScreenView()
        
    }
    
    func clearCalcScreenView() {
        
        currentViewValue = "0"
        calcScreenView.text = currentViewValue
        currentCalcValue = 0
        decimalUsed = 0
        plusNegBtn = false
        firstValue = ""
        secondValue = ""
//        firstValue = 0
//        secondValue = 0
        mathOperator = ""
    }
    
    
    func updateScreenView(buttonNumPressed: String) {
        if currentViewValue.count <= 10 {
            if currentViewValue == "0" && buttonNumPressed == "." {
                currentViewValue = "0"
            }
            else if currentViewValue == "0" {
                currentViewValue = ""
            }

            
            currentViewValue += buttonNumPressed
            calcScreenView.text = currentViewValue

            currentCalcValue = (currentViewValue as NSString).floatValue
            
            //calcScreenView.text = String(currentCalcValue)
            print(currentCalcValue)
        }
    }

    // If using a Float.
//    func assignMathValues (passInNum: String) {
//
//        var passInNumToFloat: Float = 0
//
//        passInNumToFloat = (passInNum as NSString).floatValue
//
//        if firstValue == 0 {
//            firstValue = passInNumToFloat
//        } else if firstValue != 0 && secondValue == 0 {
//            secondValue = passInNumToFloat
//        } else if firstValue != 0 && secondValue != 0 && mathOperator != "" {
//            equalTotal()
//        }
//
//        currentViewValue = ""
//
//        print("1st: \(firstValue). 2nd: \(secondValue). Math: \(mathOperator)")
//    }

    
    // If using Float
    //    func equalTotal () {
    //        var totalValue : Float = 0
    //
    //        switch mathOperator {
    //
    //        case "plus":
    //            totalValue = firstValue + secondValue
    //        case "minus":
    //            totalValue = firstValue - secondValue
    //        case "times":
    //            totalValue = firstValue * secondValue
    //        case "divide":
    //            totalValue = firstValue / secondValue
    //        default:
    //            calcScreenView.text = "error"
    //        }
    //
    //        calcScreenView.text = String(totalValue)
    //
    //        firstValue = totalValue
    //        secondValue = 0
    //        //mathOperator = ""
    //
    //        print("1st: \(firstValue). 2nd: \(secondValue). Math: \(mathOperator)")
    //
    //    }

    func assignMathValues (passInNum: String) {
        
        if firstValue == "" {
            firstValue = passInNum
        } else if firstValue != "" && secondValue == "" {
            secondValue = passInNum
            equalTotal()
        }
      
        currentViewValue = ""
        
        print("1st: \(firstValue). 2nd: \(secondValue). Math: \(mathOperator)")
    }
    
    func equalTotal () {
        
        var totalValue : Float = 0
        var floatFirstValue : Float = 0
        var floatSecondValue : Float = 0
        
        
        floatFirstValue = (firstValue as NSString).floatValue
        floatSecondValue = (secondValue as NSString).floatValue
        
        switch mathOperator {
            
        case "plus":
            totalValue = floatFirstValue + floatSecondValue
        case "minus":
            totalValue = floatFirstValue - floatSecondValue
        case "times":
            totalValue = floatFirstValue * floatSecondValue
        case "divide":
            totalValue = floatFirstValue / floatSecondValue
        default:
            calcScreenView.text = "error"
        }
        
        calcScreenView.text = String(totalValue)
        
        firstValue = String(totalValue)
        secondValue = ""
        //mathOperator = ""
        
        print("1st: \(firstValue). 2nd: \(secondValue). Math: \(mathOperator)")
        
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        //Tag 1 = 1
        if sender.tag == 1 {
            updateScreenView(buttonNumPressed: "1")
        }
        
        //Tag 2 = 2
        if sender.tag == 2 {
            updateScreenView(buttonNumPressed: "2")
        }
        
        //Tag 3 = 3
        if sender.tag == 3 {
            updateScreenView(buttonNumPressed: "3")
        }
        
        //Tag 4 = 4
        if sender.tag == 4 {
            updateScreenView(buttonNumPressed: "4")
        }
        
        //Tag 5 = 5
        if sender.tag == 5 {
            updateScreenView(buttonNumPressed: "5")
        }
        
        //Tag 6 = 6
        if sender.tag == 6 {
            updateScreenView(buttonNumPressed: "6")
        }
        
        //Tag 7 = 7
        if sender.tag == 7 {
            updateScreenView(buttonNumPressed: "7")
        }
        
        //Tag 8 = 8
        if sender.tag == 8 {
            updateScreenView(buttonNumPressed: "8")
        }
        
        //Tag 9 = 9
        if sender.tag == 9 {
            updateScreenView(buttonNumPressed: "9")
        }
        
        //Tag 10 = 0
        if sender.tag == 10 {
            updateScreenView(buttonNumPressed: "0")
        }
        
        //Tag 11 = .
        if decimalUsed < 1 && sender.tag == 11 {
            updateScreenView(buttonNumPressed: ".")
            decimalUsed += 1
        }
        
        //Tag 12 = =
        if sender.tag == 12 {
            assignMathValues(passInNum: currentViewValue)
            equalTotal()
        }
        
        //tag 13 = + "plus"
        if sender.tag == 13 {
            mathOperator = "plus"
            assignMathValues(passInNum: currentViewValue)
        }
        
        //tag 14 = - "minus
        if sender.tag == 14 {
            mathOperator = "minus"
            assignMathValues(passInNum: currentViewValue)
        }
        
        //tag 15 = X "times"
        if sender.tag == 15 {
            mathOperator = "times"
            assignMathValues(passInNum: currentViewValue)
        }
        
        //tag 16 = ÷ "divide"
        if sender.tag ==  16 {
            mathOperator = "divide"
            assignMathValues(passInNum: currentViewValue)
        }
        
        //tag 17 = %
        if sender.tag == 17 {
            
            if currentViewValue == "0" {
                updateScreenView(buttonNumPressed: "0")
            } else {
            
            var percentVal : Float = 0
            percentVal = (currentViewValue as NSString).floatValue / 100
        
            currentViewValue = String(percentVal)
            calcScreenView.text = currentViewValue
            
            }
            
        }
        
        //tag 18 = +/-
        if sender.tag == 18 {
            
            if currentViewValue == "0" {
                //do nothing
            } else if plusNegBtn == true {
                currentViewValue.remove(at: currentViewValue.startIndex)
                calcScreenView.text = currentViewValue
                plusNegBtn = false
            } else if plusNegBtn == false {
                currentViewValue = "-" + currentViewValue
                calcScreenView.text = currentViewValue
                plusNegBtn = true
            }
            
        }
        
        //tag 19 = C
        if sender.tag == 19 {
            clearCalcScreenView()
            
        }

        
        
    }
    
}

