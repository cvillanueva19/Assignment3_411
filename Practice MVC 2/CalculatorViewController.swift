//
//  CalculatorViewController.swift
//  Practice MVC 2
//
//  Created by CampusUser on 3/19/17.
//  Copyright © 2017 Fullerton. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var priceText: UITextField!
    
    @IBOutlet weak var dollarsText: UITextField!
    
    @IBOutlet weak var discountText: UITextField!
    
    @IBOutlet weak var otherText: UITextField!
    
    @IBOutlet weak var taxText: UITextField!
    
    @IBOutlet weak var calculateButton: UIButton!

    @IBOutlet weak var labelText: UILabel!
    
    @IBOutlet weak var label2Text: UILabel!
    
    var data1Pass: String!
    var data2Pass: String!
 

    @IBAction func calculateButton(_ sender: UIButton) {
        let price: Double? = Double(priceText.text!)
        
        let dollarsOff: Double? = Double(dollarsText.text!)
        
        let discount: Double? = Double(discountText.text!)
        
        let other: Double? = Double(otherText.text!)
        
        let tax: Double? = Double(taxText.text!)
        
        
        let taxedPrice = ((tax! * 0.01) + 1) * price!
        
        let discountAmount = price! * ((discount! * 0.01) + (other! * 0.01))
        
        let discountPrice = taxedPrice - discountAmount - dollarsOff!
        
        let discountString = String(discountPrice)
        label2Text.text = discountString
        
        labelText.text = priceText.text
        
        let taxedString = String(taxedPrice)
        
        data1Pass = taxedString
        data2Pass = discountString
        
        
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make Swipe Gestures
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        view.addGestureRecognizer(swipeLeft)
        // handleSwipe is a function down below...
        // #selector() selects and executes that function
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Swipe Function
    var passText: String!
    var pass2Text: String!
    func handleSwipe(_ sender:UIGestureRecognizer){
        
        passText = data1Pass
        pass2Text = data2Pass
        performSegue(withIdentifier: "showResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "showResults"{
            
            let destination = segue.destination as! ResultsViewController
            destination.result1Pass = passText
            destination.result2Pass = pass2Text
        }
    }
  
    
    
    
    // Enable Unwinding other views
    @IBAction func unwindToCalc(segue:UIStoryboardSegue){}

}
