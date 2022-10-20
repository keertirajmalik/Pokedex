//
//  Helper.swift
//  Pokedex
//
//  Created by Keertiraj Laxman Malik on 20/10/22.
//

import UIKit

extension UIFontDescriptor.AttributeName {
    static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}

extension UIFont {
    @objc class func mySystemFont(ofSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        switch weight {
        case .semibold, .bold:
            return UIFont(name: Fonts.Weight.semibold.rawValue, size: ofSize)!

        case .heavy, .black:
            return UIFont(name: Fonts.Weight.heavy.rawValue, size: ofSize)!

        case .medium, .regular:
            return UIFont(name: Fonts.Weight.regular.rawValue, size: ofSize)!

        default:
            return UIFont(name: Fonts.Weight.light.rawValue, size: ofSize)!
        }
    }

    @objc class func mySystemFont(ofSize size: CGFloat) -> UIFont {
        UIFont(name: Fonts.Weight.light.rawValue, size: size)!
    }

    @objc class func myBoldSystemFont(ofSize size: CGFloat) -> UIFont {
        UIFont(name: Fonts.Weight.semibold.rawValue, size: size)!
    }

    @objc convenience init(myCoder aDecoder: NSCoder) {
        guard
            let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,
            let fontAttribute = fontDescriptor.fontAttributes[.nsctFontUIUsage] as? String
        else {
            self.init(myCoder: aDecoder)
            return
        }
        var fontName = ""
        switch fontAttribute {
        case "CTFontRegularUsage", "CTFontMediumUsage":
            fontName = Fonts.Weight.regular.rawValue
        case "CTFontEmphasizedUsage", "CTFontBoldUsage", "CTFontSemiboldUsage":
            fontName = Fonts.Weight.semibold.rawValue
        case "CTFontHeavyUsage", "CTFontBlackUsage":
            fontName = Fonts.Weight.heavy.rawValue
        default:
            fontName = Fonts.Weight.light.rawValue
        }
        self.init(name: fontName, size: fontDescriptor.pointSize)!
    }

    class func overrideDefaultTypography() {
        guard self == UIFont.self else { return }

        if let systemFontMethodWithWeight = class_getClassMethod(self, #selector(systemFont(ofSize: weight:))),
           let mySystemFontMethodWithWeight = class_getClassMethod(self, #selector(mySystemFont(ofSize: weight:)))
        {
            method_exchangeImplementations(systemFontMethodWithWeight, mySystemFontMethodWithWeight)
        }

        if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))),
           let mySystemFontMethod = class_getClassMethod(self, #selector(mySystemFont(ofSize:)))
        {
            method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
        }

        if let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:))),
           let myBoldSystemFontMethod = class_getClassMethod(self, #selector(myBoldSystemFont(ofSize:)))
        {
            method_exchangeImplementations(boldSystemFontMethod, myBoldSystemFontMethod)
        }

        if let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))),
           let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:)))
        {
            method_exchangeImplementations(initCoderMethod, myInitCoderMethod)
        }
    }
}
