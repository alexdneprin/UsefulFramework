//
//  StringExtensions.swift
//  UsefulFramework
//
//  Created by Alexander Slobodjanjuk on 08.05.2018.
//  Copyright © 2018 Slobodyanyuk Alexander. All rights reserved.
//

import Foundation


//MARK: - Properies  -
//***************************************************

public extension String {
    
    
    // "alexdneprin@gmail.com".isEmail -> true
    var isEmail: Bool {
        return range(of: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}", options: .regularExpression, range: nil, locale: nil) != nil }
    
    
    // "Julia".firstCharacterAsString -> Optional("J")
    // "".firstCharacterAsString -> nil
    var firstCharacterAsString: String? {
        guard let first = self.first else { return nil }
        return String(first) }
    
    
    // "Julia".lastCharacterAsString -> Optional("a")
    // "".lastCharacterAsString -> nil
    var lastCharacterAsString: String? {
        guard let last = self.last else { return nil }
        return String(last) }
    
    
    // "https://google.com".isValidUrl -> true
    var isValidUrl: Bool {
        return URL(string: self) != nil }
    
    
    // "https://google.com".url -> URL(string: "https://google.com")
    // "not url".url -> nil
    var url: URL? {
        return URL(string: self) }
    
    
    //"it's%20easy%20to%20decode%20strings".urlDecoded -> "it's easy to decode strings"
    var urlDecoded: String {
        return removingPercentEncoding ?? self }
    
    
    // "it's easy to encode strings".urlEncoded -> "it's%20easy%20to%20encode%20strings"
    var urlEncoded: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)! }
    
    
    //"Hèllö Wórld!".latinized -> "Hello World!"
    var latinized: String {
        return folding(options: .diacriticInsensitive, locale: Locale.current) }
    
    
    // Check if the given string contains only white spaces
    var isWhitespace: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
    
    
    // "123abc".hasLetters -> true
    // "123".hasLetters -> false
    var hasLetters: Bool {
        return rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil }
    
    
    // "abcd".hasNumbers -> false
    // "123abc".hasNumbers -> true
    var hasNumbers: Bool {
        return rangeOfCharacter(from: .decimalDigits, options: .literal, range: nil) != nil }
    
    
    // "abc".isAlphabetic -> true
    // "123abc".isAlphabetic -> false
    var isAlphabetic: Bool {
        let hasLetters = rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
        let hasNumbers = rangeOfCharacter(from: .decimalDigits, options: .literal, range: nil) != nil
        return hasLetters && !hasNumbers
    }
    
    
    // "123abc".isAlphaNumeric -> true
    // "abc".isAlphaNumeric -> false
    var isAlphaNumeric: Bool {
        let hasLetters = rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
        let hasNumbers = rangeOfCharacter(from: .decimalDigits, options: .literal, range: nil) != nil
        let comps = components(separatedBy: .alphanumerics)
        return comps.joined(separator: "").count == 0 && hasLetters && hasNumbers
    }
    
    
    // "1".bool -> true
    // "False".bool -> false
    // "Hello".bool = nil
    var bool: Bool? {
        let selfLowercased = trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if selfLowercased == "true" || selfLowercased == "1" {
            return true
        } else if selfLowercased == "false" || selfLowercased == "0" {
            return false
        }
        return nil
    }
    
   
    //"2007-06-29".date -> Optional(Date)
    var date: Date? {
        let selfLowercased = trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: selfLowercased)
    }
    
    
    // "2007-06-29 14:23:09".dateTime -> Optional(Date)
    var dateTime: Date? {
        let selfLowercased = trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.date(from: selfLowercased)
    }
    
    
    // "101".int -> 101
    var int: Int? {
        return Int(self) }

}


//MARK: - Methods  -
//***************************************************


public extension String {

    // Parameter length: number of characters to limit lorem ipsum to (default is 445 - full lorem ipsum).
    // Returns: Lorem ipsum dolor sit amet... string.
    static func loremIpsum(ofLength length: Int = 445) -> String {
        guard length > 0 else { return "" }
        
        // https://www.lipsum.com/
        let loremIpsum = """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
        """
        if loremIpsum.count > length {
            return String(loremIpsum[loremIpsum.startIndex..<loremIpsum.index(loremIpsum.startIndex, offsetBy: length)])
        }
        return loremIpsum
    }
    
    
    // Parameter locale: Locale (default is Locale.current)
    // Returns: Optional Float value from given string.
    func float(locale: Locale = .current) -> Float? {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.allowsFloats = true
        return formatter.number(from: self)?.floatValue
    }
    
    
    // Parameter locale: Locale (default is Locale.current)
    // Returns: Optional Double value from given string.
    func double(locale: Locale = .current) -> Double? {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.allowsFloats = true
        return formatter.number(from: self)?.doubleValue
    }
    
    
    // Parameter locale: Locale (default is Locale.current)
    // Returns: Optional CGFloat value from given string.
    func cgFloat(locale: Locale = .current) -> CGFloat? {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.allowsFloats = true
        return formatter.number(from: self) as? CGFloat
    }
    
    
    // "Hello\ntest".lines() -> ["Hello", "test"]
    func lines() -> [String] {
        var result = [String]()
        enumerateLines { line, _ in
            result.append(line)
        }
        return result
    }
    
    
    // "Julia".localized -> Юля
    func localized(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }
    
    
    // "Swift is amazing".words() -> ["Swift", "is", "amazing"]
    func words() -> [String] {
        // https://stackoverflow.com/questions/42822838
        let chararacterSet = CharacterSet.whitespacesAndNewlines.union(.punctuationCharacters)
        let comps = components(separatedBy: chararacterSet)
        return comps.filter { !$0.isEmpty }
    }
    
    
    // "Swift is amazing".wordsCount() -> 3
    func wordCount() -> Int {
        // https://stackoverflow.com/questions/42822838
        let chararacterSet = CharacterSet.whitespacesAndNewlines.union(.punctuationCharacters)
        let comps = components(separatedBy: chararacterSet)
        let words = comps.filter { !$0.isEmpty }
        return words.count
    }
    

    // "Hello World!"[3] -> "l"
    // "Hello World!"[20] -> nil
    subscript(safe i: Int) -> Character? {
        guard i >= 0 && i < count else { return nil }
        return self[index(startIndex, offsetBy: i)]
    }
    
    
    // "Hello World!"[6..<11] -> "World"
    // "Hello World!"[21..<110] -> nil
    subscript(safe range: CountableRange<Int>) -> String? {
        guard let lowerIndex = index(startIndex, offsetBy: max(0, range.lowerBound), limitedBy: endIndex) else { return nil }
        guard let upperIndex = index(lowerIndex, offsetBy: range.upperBound - range.lowerBound, limitedBy: endIndex) else { return nil }
        return String(self[lowerIndex..<upperIndex])
    }
    
    
    // var str = "sOme vaRiabLe Name"
    // str.camelize()
    // print(str) // prints "someVariableName"
    mutating func camelize() {
        let source = lowercased()
        let first = source[..<source.index(after: source.startIndex)]
        if source.contains(" ") {
            let connected = source.capitalized.replacingOccurrences(of: " ", with: "")
            let camel = connected.replacingOccurrences(of: "\n", with: "")
            let rest = String(camel.dropFirst())
            self = first + rest
            return
        }
        let rest = String(source.dropFirst())
        
        self = first + rest
    }
    
    
    // "Hello World!".contain("O") -> false
    // "Hello World!".contain("o", caseSensitive: false) -> true
    // Parameters:
    // - string: substring to search for.
    // - caseSensitive: set true for case sensitive search (default is true).
    // Returns: true if string contains one or more instance of substring.
    func contains(_ string: String, caseSensitive: Bool = true) -> Bool {
        if !caseSensitive {
            return range(of: string, options: .caseInsensitive) != nil
        }
        return range(of: string) != nil
    }
    
    
    // "Hello World!".count(of: "o") -> 2
    // "Hello World!".count(of: "L", caseSensitive: false) -> 3
    // Parameters:
    // - string: substring to search for.
    // - caseSensitive: set true for case sensitive search (default is true).
    // Returns: count of appearance of substring in string.
    func count(of string: String, caseSensitive: Bool = true) -> Int {
        if !caseSensitive {
            return lowercased().components(separatedBy: string.lowercased()).count - 1
        }
        return components(separatedBy: string).count - 1
    }
    
    
    // "Julia".reverce() -> "ailuJ"
    mutating func reverse() {
        let chars: [Character] = reversed()
        self = String(chars)
    }

    
    // ---------------------------------------

    // var str = "Hello World"
    // str.slice(from: 6, length: 5) -> "World"
    mutating func slice(from i: Int, length: Int) {
        if let str = self.slicing(from: i, length: length) { self = String(str) }
    }
    
    // var str = "Hello World"
    // str.slice(at: 6) -> "World"
    
    mutating func slice(at i: Int) {
        guard i < count else { return }
        if let str = self[safe: i..<count] {
            self = str
        }
    }
    
    func slicing(from i: Int, length: Int) -> String? {
        guard length >= 0, i >= 0, i < count  else { return nil }
        guard i.advanced(by: length) <= count else {
            return self[safe: i..<count]
        }
        guard length > 0 else { return "" }
        return self[safe: i..<i.advanced(by: length)]
    }
    
    // ---------------------------------------

    
    // "2017-01-15".date(withFormat: "yyyy-MM-dd") -> Date set to Jan 15, 2017
    // "not date string".date(withFormat: "yyyy-MM-dd") -> nil
    func date(withFormat format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }

}


//MARK: - Operators  -
//***************************************************


public extension String {
    
    // 'bar' * 3 -> "barbarbar"
    // Parameters:
    // - lhs: string to repeat.
    // - rhs: number of times to repeat character.
    // Returns: new string with given string repeated n times.
    static func * (lhs: String, rhs: Int) -> String {
        guard rhs > 0 else { return "" }
        return String(repeating: lhs, count: rhs)
    }
 
    
    // 3 * 'bar' -> "barbarbar"
    static func * (lhs: Int, rhs: String) -> String {
        guard lhs > 0 else { return "" }
        return String(repeating: rhs, count: lhs)
    }
    
}


//MARK: - NSAttributedString extensions  -
//***************************************************


public extension String {
    
    private typealias Font = UIFont

    
    // Bold string.
    var bold: NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [.font: Font.boldSystemFont(ofSize: Font.systemFontSize)]) }
    
    
    // Underlined string
    var underline: NSAttributedString {
        return NSAttributedString(string: self, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue]) }
    
    
    // Strikethrough string.
    var strikethrough: NSAttributedString {
        return NSAttributedString(string: self, attributes: [.strikethroughStyle: NSNumber(value: NSUnderlineStyle.single.rawValue as Int)]) }

    
    // Italic string.
    var italic: NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [.font: UIFont.italicSystemFont(ofSize: UIFont.systemFontSize)]) }
    

    // Add color to string.
    // Parameter color: text color.
    // Returns: a NSAttributedString versions of string colored with given color.
    func colored(with color: UIColor) -> NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [.foregroundColor: color]) }

}
