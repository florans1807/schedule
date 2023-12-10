//
//  extensions.swift
//  schedule
//
//  Created by Флоранс on 04.12.2023.
//

import Foundation
import UIKit

extension UIButton {
    override open var isSelected: Bool {
        didSet {
            super.isSelected = isSelected
            backgroundColor = isSelected ? UIColor.darkGray : UIColor.systemGray4
        }
    }
}

extension UIStackView {
    func addHorizontalSeparators(color : UIColor) {
        let separatorsToAdd = self.arrangedSubviews.count - 1
        var insertAt = 1
        for _ in 1...separatorsToAdd {
            let separator = createSeparator(color: color)
            insertArrangedSubview(separator, at: insertAt)
            insertAt += 2
            separator.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1).isActive = true
        }
    }

    private func createSeparator(color : UIColor) -> UIView {
        let separator = UIView()
        separator.widthAnchor.constraint(equalToConstant: 1).isActive = true
        separator.backgroundColor = color
        return separator
    }
}

extension UIView {
    func round(corners: UIRectCorner, radius: CGFloat) {
        _ = _round(corners: corners, radius: radius)
    }
    
    func round(corners: UIRectCorner, radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        let mask = _round(corners: corners, radius: radius)
        addBorder(mask: mask, borderColor: borderColor, borderWidth: borderWidth)
    }
    
    func fullyRound(diameter: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        layer.masksToBounds = true
        layer.cornerRadius = diameter / 2
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor;
    }
    
}

private extension UIView {
    
    @discardableResult func _round(corners: UIRectCorner, radius: CGFloat) -> CAShapeLayer {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        return mask
    }
    
    func addBorder(mask: CAShapeLayer, borderColor: UIColor, borderWidth: CGFloat) {
        let borderLayer = CAShapeLayer()
        borderLayer.path = mask.path
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = borderColor.cgColor
        borderLayer.lineWidth = borderWidth
        borderLayer.frame = bounds
        layer.addSublayer(borderLayer)
    }
    
}

extension Date {
   static var tomorrow:  Date { return Date().dayAfter }
   static var today: Date {return Date()}
   var dayAfter: Date {
      return Calendar.current.date(byAdding: .day, value: 1, to: Date())!
   }
    
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }
    
    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}

extension Int {
     func hours() -> String {
         var hourString: String!
         if "1".contains("\(self % 10)")      {hourString = "час"}
         if "234".contains("\(self % 10)")    {hourString = "часа" }
         if "567890".contains("\(self % 10)") {hourString = "часов"}
         if 11...14 ~= self % 100                   {hourString = "часов"}
         return "\(self) " + hourString
    }
}
