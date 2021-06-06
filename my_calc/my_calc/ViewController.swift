import UIKit

class ViewController: UIViewController {

    var inputNumber: Double = 0
    var firstArgument: Double = 0
    var result: Double = 0
    var resultString: String = ""
    var secondString: String = ""
    var action: String = ""
    var resultPressed: Bool = false
    var resultCalculated: Bool = false
    var actionPressed: Bool = false
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var actionLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBAction func numberPressed(_ sender: UIButton) {
        
        if mainLabel.text!.count  < 9 {
            // Numbers
            // Decimal
            if sender.tag == 10 && !mainLabel.text!.contains("."){
                mainLabel.text!.append(".")
            // First digit or after Result pressed
            } else if mainLabel.text! == "0" || resultCalculated {
//                secondLabel.text = String(result)
//                firstArgument = result
                mainLabel.text = String(sender.tag)
                resultCalculated = false
                
                if resultPressed {
                    resultPressed = false
                    result = 0
//                    firstArgument = 0
                    secondLabel.text = ""
                    actionLabel.text = ""
                }
            }
            // Other digits
            else if sender.tag != 10 {
                mainLabel.text = mainLabel.text! + String(sender.tag)
            }
        }
        inputNumber = Double (mainLabel.text!)!
    }
    
    @IBAction func actionPressed(_ sender: UIButton) {
        
        if sender.tag == 18 {
            // Clear
            if mainLabel.text! == "0" || resultPressed || resultCalculated {
                // Clear all
                secondLabel.text! = ""
                actionLabel.text! = ""
                action = ""
                firstArgument = 0
                mainLabel.text! = "0"
                inputNumber = 0
                resultPressed = false
                actionPressed = false
                resultCalculated = false
                result = 0
                resultString = ""
            } else {
                // Clear main label only
                mainLabel.text! = "0"
                inputNumber = 0
            }
        }
        
        if sender.tag == 17 {
            // Plus-Minus
            if Double(mainLabel.text!)! > 0 {
                mainLabel.text = "-" + mainLabel.text!
            } else if Double(mainLabel.text!)! == 0 {
            } else {
                mainLabel.text?.removeFirst()
            }
            inputNumber = Double (mainLabel.text!)!
        }
        
        if sender.tag > 11 && sender.tag < 16 {
            // Math Actions

            if resultPressed {
                firstArgument = result
                secondLabel.text = resultString
 //               inputNumber = 0
                result = 0
                mainLabel.text = "0"
                resultPressed = false
            }
            
            else if !resultCalculated && actionPressed {
                
                secondLabel.text = resultString
                               
                switch action {
                case "+": result = firstArgument + inputNumber
                case "-": result = firstArgument - inputNumber
                case "*": result = firstArgument * inputNumber
                case "/" : if inputNumber != 0 {
                    result = firstArgument / inputNumber }
                default: break
                }
                               
                firstArgument = result
                resultString = String(result)
            
                if resultString.count > 9 {
                    resultString.removeLast(resultString.count - 9)
                    }
                
                mainLabel.text = resultString
                resultCalculated = true
            }
        
            else if !actionPressed {
                firstArgument = inputNumber
                secondString = String(firstArgument)
                
                if secondString.count > 9 {
                    secondString.removeLast(secondString.count - 9)
                }
                secondLabel.text = secondString
//                    inputNumber = 0
                mainLabel.text = "0"
                
            }
            
            switch sender.tag {
            case 12: action = "+"
            case 13: action = "-"
            case 14: action = "*"
            default: action = "/"
            }
            actionPressed = true
            actionLabel.text = action
            
        }

        if sender.tag == 16 {
            // Remove Last Digit
            if mainLabel.text!.count > 1 {
                mainLabel.text!.removeLast()
            } else if mainLabel.text != "0" {
                mainLabel.text = "0"
            }
            inputNumber = Double (mainLabel.text!)!
            resultPressed = false
            actionPressed = false
            firstArgument = 0
            inputNumber = 0
            result = 0
            resultString = ""
        }
        
        if sender.tag == 11 {
            // Result
            switch action {
            case "+": result = firstArgument + inputNumber
            case "-": result = firstArgument - inputNumber
            case "*": result = firstArgument * inputNumber
            default:
                if inputNumber != 0 {
                result = firstArgument / inputNumber
                }
            }

            resultString = String(result)
        
            if resultString.count > 9 {
                resultString.removeLast(resultString.count - 9)
                }
            
            mainLabel.text = resultString
            firstArgument = result
  //          inputNumber = 0
            resultPressed = true
            resultCalculated = true
  //          inputNumber = 0
  //          secondLabel.text = ""
        }
            
}
    
}
        
        
 
