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
    
    var data1Pass: Double!
    var data2Pass: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        priceText.becomeFirstResponder()
        priceText.keyboardType = UIKeyboardType.decimalPad
        dollarsText.keyboardType = UIKeyboardType.decimalPad
        discountText.keyboardType = UIKeyboardType.decimalPad
        otherText.keyboardType = UIKeyboardType.decimalPad
        taxText.keyboardType = UIKeyboardType.decimalPad
        
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
    
    
    @IBAction func calculateButton(_ sender: UIButton) {
        priceText.resignFirstResponder()
        dollarsText.resignFirstResponder()
        discountText.resignFirstResponder()
        otherText.resignFirstResponder()
        taxText.resignFirstResponder()
        
        var price: Double? = Double(priceText.text!)
        if price == nil {
            price = 0.0
        }
        
        var dollarsOff: Double? = Double(dollarsText.text!)
        if dollarsOff == nil {
            dollarsOff = 0.0
        }
        
        var discount: Double? = Double(discountText.text!)
        if discount == nil {
            discount = 0.0
        }
        
        var other: Double? = Double(otherText.text!)
        if other == nil {
            other = 0.0
        }
        
        var tax: Double? = Double(taxText.text!)
        if tax == nil {
            tax = 0.0
        }
        
        let taxedPrice = ((tax! * 0.01) + 1) * price!
        
        let discountAmount = price! * ((discount! * 0.01) + (other! * 0.01))
        
        let discountPrice = taxedPrice - discountAmount - dollarsOff!
        
        label2Text.text = String (format: "%.2f",discountPrice)
        
        labelText.text = String (format: "%.2f",taxedPrice)
        
        
        data1Pass = taxedPrice
        data2Pass = discountPrice
        
        
    }
    
    
    
    // Swipe Function
    var passText: Double!
    var pass2Text: Double!
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
