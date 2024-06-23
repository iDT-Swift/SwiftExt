//
//  Regex+Ext.swift
//  
//
//  Created by Gustavo Halperin on 10/10/23.
//

import RegexBuilder

@available(iOS 16.0, *)
extension CharacterClass {
    static let lowercaseLetter:CharacterClass = CharacterClass.generalCategory(.lowercaseLetter)
    static let uppercaseLetter:CharacterClass = CharacterClass.generalCategory(.uppercaseLetter)
    static let letter:CharacterClass = lowercaseLetter.union(uppercaseLetter)
    static let word_:CharacterClass = letter.union(.digit)
}

@available(iOS 16.0, *)
let emailRegex = Regex {
    OneOrMore { CharacterClass.letter }
    ZeroOrMore {
        ZeroOrMore (CharacterClass.word_)
        ZeroOrMore ("_")
        ZeroOrMore (".")
        ZeroOrMore ("+")
        ZeroOrMore ("-")
    }
    "@"
    OneOrMore { CharacterClass.letter }
    ZeroOrMore {
        ZeroOrMore (CharacterClass.word_)
        ZeroOrMore (".")
        ZeroOrMore ("-")
    }
    "."
    Repeat(2...) {
        OneOrMore { CharacterClass.letter }
    }
}
