//
//  String+Helper.swift
//  SRHelper
//
//  Created by Sajeev Raj on 9/12/18.
//  Copyright © 2018 Sajeev. All rights reserved.
//

import Foundation

// underline a string
prefix operator --

prefix func -- ( text: String) -> NSAttributedString {
    return NSAttributedString(string: text, attributes:
        [.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
}

extension String {
    
    var url: URL? {
        return URL(string: self)
    }
    
    var isLatitude: Bool {
        let strindgRegex = "^(\\+|-)?((\\d((\\.)|\\.\\d{1,6})?)|(0*?[0-8]\\d((\\.)|\\.\\d{1,6})?)|(0*?90((\\.)|\\.0{1,6})?))$"
        let result = NSPredicate(format:"SELF MATCHES %@", strindgRegex).evaluate(with: self)
        return result
    }
    
    var isLongitude: Bool {
        let strindgRegex = "^(\\+|-)?((\\d((\\.)|\\.\\d{1,6})?)|(0*?\\d\\d((\\.)|\\.\\d{1,6})?)|(0*?1[0-7]\\d((\\.)|\\.\\d{1,6})?)|(0*?180((\\.)|\\.0{1,6})?))$"
        let result = NSPredicate(format:"SELF MATCHES %@", strindgRegex).evaluate(with: self)
        return result
    }
    
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
    
    var trimmed: String {
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    var image: UIImage {
        guard let url  = URL(string: self) else { return UIImage() }
        let data = try? Data(contentsOf: url)
        if let imageData = data {
            return UIImage(data: imageData) ?? UIImage()
        }
        return UIImage()
    }
    
    var storyboard: UIStoryboard {
        return UIStoryboard(name: self.capitalized, bundle: nil)
    }
    
    static func combine(stringList: [String?], seperator: String) -> String {
        let result = stringList.compactMap{$0}
        return result.joined(separator: seperator)
    }
    
    func remove(characterSet: CharacterSet) -> String {
        return String(String.UnicodeScalarView(unicodeScalars.filter { !characterSet.contains($0) }))
    }
    
    func color(with color: UIColor) -> NSAttributedString {
        return NSAttributedString(string: self, attributes: [.foregroundColor: color])
    }
    
    func toDate(format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}
