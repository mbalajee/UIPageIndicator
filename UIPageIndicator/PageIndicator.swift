//
//  PageIndicator.swift
//  UIPageIndicator
//
//  Created by Balaji M on 2/18/21.
//

import UIKit

class PageIndicator: UIControl {
    
    var color = UIColor.white
    var selectedColor = UIColor.red
    
    var indicators = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var currentIndex = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        UIGraphicsGetCurrentContext()!.clear(rect)
                
        let circles = CGFloat(indicators)
        
        let height = rect.height
        
        var dotDiameter = height / 2
        
        let spaceBetweenDots = dotDiameter * 0.2
        
        dotDiameter = dotDiameter - spaceBetweenDots
        
        let minWidthForAllDots = (dotDiameter * circles) + (spaceBetweenDots * (circles - 1))
        
        let startX = (rect.width - minWidthForAllDots) / 2
                
        let radiusBigger = dotDiameter / 2
        let radiusSmaller = dotDiameter / 4
        
        var x = startX
        let y = spaceBetweenDots / 2

        for i in 0..<indicators {
                    
            let center = CGPoint(x: x + radiusBigger, y: y + dotDiameter)
    
            var radius: CGFloat
            
            if i == currentIndex {
                selectedColor.setFill()
                radius = radiusBigger
            } else {
                color.setFill()
                radius = radiusSmaller
            }
            
            let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: 360, clockwise: true)
            path.fill()
            
            x = x + dotDiameter + spaceBetweenDots
        }
    }
}
