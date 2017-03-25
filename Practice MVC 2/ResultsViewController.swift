//
//  ResultsViewController.swift
//  Practice MVC 2
//
//  Created by CampusUser on 3/19/17.
//  Copyright © 2017 Fullerton. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var result1Pass: String!
    var result2Pass: String!
    
    @IBOutlet weak var passingLabel: UILabel!
    @IBOutlet weak var passing2Label: UILabel!
    
    @IBOutlet weak var savedLabel: UILabel!
    
    @IBOutlet weak var savedpercentLabel: UILabel!
    
    @IBOutlet weak var paypercentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passingLabel.text = result1Pass
        passing2Label.text = result2Pass
        
        let result1 = Double(result1Pass)
        let result2 = Double(result2Pass)
        
        let payPercent = (result2! / result1!) * 100
        
        paypercentLabel.text = String(payPercent)
        
        let saved = result1! - result2!
        savedLabel.text = String(saved)
        
        let savedPercent = 100 - payPercent
        savedpercentLabel.text = String(savedPercent)
        
        
        
        
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        view.addGestureRecognizer(swipeRight)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    // Swipe Function
    func handleSwipe(_ sender:UIGestureRecognizer){
        self.performSegue(withIdentifier: "unwindToCalc", sender: self)
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}
