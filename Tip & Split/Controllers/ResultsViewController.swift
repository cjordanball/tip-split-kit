//
//  ResultsViewController.swift
//  Tip & Split
//
//  Created by C. Jordan Ball III on 7/15/21.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalPerCap: UILabel!
    @IBOutlet weak var instructLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var shareAmount: String = "$0.00";
    var numDiners: Int = 2;
    var tipRate: Int = 10;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.layer.cornerRadius = 8;

        totalPerCap.text = String(shareAmount);
        
        instructLabel.text = "Split \(numDiners != 2 ? "among" : "between") \(String(numDiners)) people, with a \(tipRate)% tip." ;
    }
    

    @IBAction func recalcPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
