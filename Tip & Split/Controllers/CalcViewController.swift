//
//  ViewController.swift
//  Tip & Split
//
//  Created by C. Jordan Ball III on 7/3/21.
//

import UIKit

class CalcViewController: UIViewController {
    
    @IBOutlet weak var totalAmount: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var calcButton: UIButton!
    @IBOutlet weak var stepper: UIStepper!
    
    @IBAction func inputFieldChanged(_ sender: UITextField) {
        if (sender.text != "") {
            calcButton.alpha = 1.0;
            calcButton.isEnabled = true;
        } else {
            calcButton.alpha = 0.3;
            calcButton.isEnabled = false;
        }
    }
    
    var buttonArray: Array<UIButton> = [];
    var tipAmount: Float = 0.1;
    var splitNum: Int = 2;
    var billAmount: Float = 0;
    var resultingAmount: String = "$0.00";
    
    override func viewDidLoad() {
        super.viewDidLoad();
        buttonArray.append(contentsOf: [zeroPctButton, tenPctButton, twentyPctButton]);
        tenPctButton.backgroundColor = UIColor.yellow;
        tenPctButton.layer.cornerRadius = 10;
        calcButton.alpha = 0.3;
        calcButton.isEnabled = false;
        calcButton.layer.cornerRadius = 8;
        stepper.value = 2;
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        tipAmount = Float(buttonArray.firstIndex(of: sender)!)/10.0;
        totalAmount.endEditing(true);
        for button in buttonArray {
            if button === sender {
                button.backgroundColor = UIColor.yellow;
                button.layer.cornerRadius = 10;
            } else {
                button.backgroundColor = UIColor.clear;
            }
        }
    }

    @IBAction func stepperValChange(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value));
        splitNum = Int(sender.value);
        totalAmount.endEditing(true);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            print("Segue");
            let destinationVC = segue.destination as! ResultsViewController;
            print(resultingAmount);
            destinationVC.shareAmount = resultingAmount;
            destinationVC.numDiners = Int(splitNum);
            destinationVC.tipRate = Int(tipAmount * 100);
        }
    }    
    
    @IBAction func calcPressed(_ sender: UIButton) {
        if let amount = totalAmount.text {
            if let billAmount = Float(amount) {
                resultingAmount = "$" + String(format: "%.2f", (billAmount * (1.0 + (tipAmount))/Float(splitNum)));
                print(resultingAmount);
                performSegue(withIdentifier: "goToResult", sender: self);
            } else {
                fatalError("Enter amounts!");
            }
        };
    }
}

