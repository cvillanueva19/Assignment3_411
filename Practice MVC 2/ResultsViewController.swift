//
//  ResultsViewController.swift
//  Practice MVC 2
//
//  Created by CampusUser on 3/19/17.
//  Copyright © 2017 Fullerton. All rights reserved.
//

import UIKit

var passedOriginal: Double!
var passedPay: Double!

class ResultsViewController: UIViewController {
    
    var result1Pass: Double!
    var result2Pass: Double!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passedOriginal = result1Pass
        passedPay = result2Pass
        
        
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
    
    
}
class GraphView2: UIView {
    
    
    override func draw(_ rect: CGRect) {
        let context:CGContext = UIGraphicsGetCurrentContext()!
        let context2:CGContext = UIGraphicsGetCurrentContext()!
        let context3:CGContext = UIGraphicsGetCurrentContext()!
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height - 55
        
        //ratio of boxes
        let percent1 = passedPay/passedOriginal
        
        
        let leftGuide:CGFloat = 16.0
        let rightGuide:CGFloat = screenWidth - 180
        let topGuide:CGFloat = 64.0 + 16.0
        
        let percentInt = CGFloat((screenHeight-96) * CGFloat(percent1))
        let box1Height = screenHeight - 96 - percentInt
        let box2Height = (screenHeight-96) - box1Height - 5
        
        let label1 = "Original Price"
        let label2 = "You Pay"
        let label3 = "You Saved"
        
        let originalString = "$" + String(format: "%.2f", passedOriginal)
        let payPriceString = "$" + String(format: "%.2f", passedPay)
        let payPercent = ((passedPay/passedOriginal) * 100)
        let payPercentString = String (format: "%.2f",payPercent) + "%"
        let saved = passedOriginal - passedPay
        let savedString = "$" + String(format: "%.2f", saved)
        let savedPercent = 100 - payPercent
        let savedPercentString = String (format: "%.2f",savedPercent) + "%"
        
        //Text Attribute
        let textAttributes = [
            NSFontAttributeName: UIFont(name: "Helvetica Bold", size: 16.0)!,
            NSForegroundColorAttributeName:UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        ]
        
        
        context.setFillColor(0x84516D)
        context.fill(CGRect(x:leftGuide, y:topGuide, width:screenWidth - 200, height:screenHeight - 96.0))//x&y is top left corner
        label1.draw(at: CGPoint(x: leftGuide + 16.0, y: topGuide + 16.0), withAttributes: textAttributes)
        
        //Original Price print
        originalString.draw(at: CGPoint(x: leftGuide + 16.0, y: topGuide + 16.0 + 20.0), withAttributes: textAttributes)
        
        //Save Box
        context2.setFillColor(0x73221D)
        context2.fill(CGRect(x:rightGuide, y:topGuide, width:screenWidth - 210, height:box1Height))//x&y is top left corner
        
        
        //Pay Box
        context3.setFillColor(0x7321D)
        context3.fill(CGRect(x:rightGuide, y:topGuide + box1Height + 5, width:screenWidth - 210, height:box2Height))//x&y is top left corner
        
        
        //Save Box
        if percent1 > 0.85 { // if Save(red) box is smaller than text -> move text to left box
            label3.draw(at: CGPoint(x: leftGuide + 16.0, y: topGuide + 16.0 + 60.0), withAttributes: textAttributes)
            savedString.draw(at: CGPoint(x: leftGuide + 16.0, y: topGuide + 16.0 + 80.0), withAttributes: textAttributes)
            savedPercentString.draw(at: CGPoint(x: leftGuide + 16.0, y: topGuide + 16.0 + 100.0), withAttributes: textAttributes)
        }
        else{
            label3.draw(at: CGPoint(x:rightGuide + 16, y:topGuide + 16),withAttributes: textAttributes)
            savedString.draw(at: CGPoint(x:rightGuide + 16, y:topGuide + 16 + 20),withAttributes: textAttributes)
            savedPercentString.draw(at: CGPoint(x:rightGuide + 16, y:topGuide + 16 + 20 + 20),withAttributes: textAttributes)
        }
        
        
        
        //Pay Box
        if percent1 < 0.15 { // if Pay(red) box is smaller than text -> move text to left box
            label2.draw(at: CGPoint(x: leftGuide + 16.0, y: topGuide + 16.0 + 60.0), withAttributes: textAttributes)
            payPriceString.draw(at: CGPoint(x: leftGuide + 16.0, y: topGuide + 16.0 + 80.0), withAttributes: textAttributes)
            payPercentString.draw(at: CGPoint(x: leftGuide + 16.0, y: topGuide + 16.0 + 100.0), withAttributes: textAttributes)
        }
        else{
            label2.draw(at: CGPoint(x:rightGuide + 16, y:topGuide + box1Height + 5 + 16), withAttributes: textAttributes)
            payPriceString.draw(at: CGPoint(x:rightGuide + 16, y:topGuide + box1Height + 5 + 16 + 20), withAttributes: textAttributes)
            payPercentString.draw(at: CGPoint(x:rightGuide + 16, y:topGuide + box1Height + 5 + 16 + 20 + 20), withAttributes: textAttributes)
        }
        
    }
    
    
}
