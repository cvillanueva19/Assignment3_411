//
//  GraphView.swift
//  MVC
//
//  Created by CampusUser on 3/6/17.
//  Copyright © 2017 Fullerton. All rights reserved.
//

import UIKit

extension CGContext {
    func setFillColor(_ hex:Int) {
        // Mask different values of the hex code
        // 0xFF0000 - Red
        // 0x00FF00 - Green
        // 0x0000FF - Blue
        
        let redColor:CGFloat = CGFloat((hex >> 16) & 0xFF) / 255.0
        let greenColor:CGFloat = CGFloat((hex >> 8 ) & 0xFF) / 255.0
        let blueColor:CGFloat = CGFloat(hex & 0xFF) / 255.0
        
        setFillColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1.0)
    }
    
}

class GraphView: UIView {
    
    // let CalcData: DiscountCalc = DiscountCalc.shared
    
    override func draw(_ rect: CGRect) {
        let context:CGContext = UIGraphicsGetCurrentContext()!
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        let leftGuide:CGFloat = 16.0
        //    let rightGuide:CGFloat = screenWidth - 16.0
        let topGuide:CGFloat = 64.0 + 16.0 //80.0
        //  let botGuide:CGFloat = screenHeight - 16.0
        
        //Draw Rectangle
        //context.setFillColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0)
        context.setFillColor(0x84516D)
        context.fill(CGRect(x:leftGuide, y:topGuide, width:screenWidth - 32.0, height:screenHeight - 96.0))//x&y is top left corner
        
      /*  //Draw Text
        let myText = "Cyan Box"
        let subText = "Baby blue..."
        
        //Text Attribute
        let textAttributes = [
            NSFontAttributeName: UIFont(name: "Helvetica Bold", size: 16.0)!,
            NSForegroundColorAttributeName:UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        ]
        
        let myTextPos:CGPoint = CGPoint(x: leftGuide + 16.0, y: topGuide + 16.0)
        
        myText.draw(at: myTextPos, withAttributes: textAttributes)
        subText.draw(at: CGPoint(x: leftGuide + 16.0, y: topGuide + 32.0), withAttributes: textAttributes)
 
    }
    */
    
    }
}
