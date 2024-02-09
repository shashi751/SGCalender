//
//  UIView+Extension.swift
//  SGCalendar
//
//  Created by Shashi Gupta on 09/02/24.
//

import Foundation
import UIKit

extension UIView {
    enum Corner:Int {
        case bottomRight = 0,
             topRight,
             bottomLeft,
             topLeft
    }
    
    private func parseCorner(corner: Corner) -> CACornerMask.Element {
        let corners: [CACornerMask.Element] = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        return corners[corner.rawValue]
    }
    
    private func createMask(corners: [Corner]) -> UInt {
        return corners.reduce(0, { (a, b) -> UInt in
            return a + parseCorner(corner: b).rawValue
        })
    }
    
    func roundCorners(corners: [Corner], amount: CGFloat = 5) {
        layer.cornerRadius = amount
        let maskedCorners: CACornerMask = CACornerMask(rawValue: createMask(corners: corners))
        if #available(iOS 11.0, *) {
            layer.maskedCorners = maskedCorners
        } else {
            // Fallback on earlier versions
        }
    }
}
