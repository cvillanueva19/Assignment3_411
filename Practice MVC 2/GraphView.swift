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
    
    
    override func draw(_ rect: CGRect) {
        let context:CGContext = UIGraphicsGetCurrentContext()!
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height - 55
        
        let leftGuide:CGFloat = 16.0
        
        let topGuide:CGFloat = 64.0 + 16.0
        
        context.setFillColor(0x84516D)
        context.fill(CGRect(x:leftGuide, y:topGuide, width:screenWidth - 32.0, height:screenHeight - 96.0))
        
    }
}
