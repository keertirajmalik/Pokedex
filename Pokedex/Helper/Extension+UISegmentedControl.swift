//
//  SegmentedControl.swift
//  Pokedex
//
//  Created by Keertiraj Laxman Malik on 05/11/22.
//

import UIKit

extension UIImage {
    class func getSegRect(color: CGColor, andSize size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color)
        let rectangle = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        context?.fill(rectangle)

        let rectangleImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return rectangleImage!
    }
}

extension UISegmentedControl {
    func removeBorder() {
        let background = UIImage.getSegRect(color: UIColor.white.cgColor, andSize: bounds.size)
        setBackgroundImage(background, for: .normal, barMetrics: .default)
        setBackgroundImage(background, for: .selected, barMetrics: .default)
        setBackgroundImage(background, for: .highlighted, barMetrics: .default)

        let dividerLine = UIImage.getSegRect(color: UIColor.white.cgColor, andSize: CGSize(width: 1, height: 1))
        let font = UIFont.systemFont(ofSize: 16)

        setDividerImage(dividerLine, forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.font: font], for: .normal)
        setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1.0), NSAttributedString.Key.font: font], for: .selected)
    }

    func highlightSelectedSegment() {
        removeBorder()
        let lineWidth: CGFloat = bounds.size.width / CGFloat(numberOfSegments)
        let lineHeight: CGFloat = 2.0
        let lineXPosition = CGFloat(selectedSegmentIndex * Int(lineWidth))
        let lineYPosition = bounds.size.height + 10
        let underlineFrame = CGRect(x: lineXPosition, y: lineYPosition, width: lineWidth + 2, height: lineHeight)
        let underLine = UIView(frame: underlineFrame)
        underLine.backgroundColor = UIColor.purple // bottom line color
        underLine.tag = 1
        addSubview(underLine)
    }

    func underlinePosition() {
        guard let underLine = viewWithTag(1) else { return }
        let xPosition = (bounds.width / CGFloat(numberOfSegments)) * CGFloat(selectedSegmentIndex)
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: {
            underLine.frame.origin.x = xPosition
        })
    }
}
