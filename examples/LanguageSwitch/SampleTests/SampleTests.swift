//
//  SampleTests.swift
//  SampleTests
//
//  Created by Roy Marmelstein on 26/09/2015.
//  Copyright © 2015 Roy Marmelstein. All rights reserved.
//

import XCTest
import Localize_Swift

class SampleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        Localize.resetCurrentLanaguageToDefault()
    }
    
    func testSwift1Syntax() {
        let testString = "Hello world";
        Localize.setCurrentLanguage("fr")
        let translatedString = Localized(testString)
        XCTAssertEqual(translatedString, "Bonjour le monde")
    }
    
    func testSwift2Syntax() {
        let testString = "Hello world";
        Localize.setCurrentLanguage("fr")
        let translatedString = testString.localized()
        XCTAssertEqual(translatedString, "Bonjour le monde")
    }
    
    func testMultipleLanguageSwitching() {
        let testString = "Hello world";
        Localize.setCurrentLanguage("es")
        XCTAssertEqual(testString.localized(), "Hola mundo")
        Localize.setCurrentLanguage("de")
        XCTAssertEqual(testString.localized(), "Hallo Welt")
        Localize.resetCurrentLanaguageToDefault()
        XCTAssertEqual(testString.localized(), "Hello world")
    }

    func testFalseLanguage() {
        let testString = "Hello world";
        Localize.setCurrentLanguage("xxx")
        XCTAssertEqual(testString.localized(), "Hello world")
    }
    
    func testFalseString() {
        let testString = "Non translated string";
        Localize.setCurrentLanguage("fr")
        XCTAssertEqual(testString.localized(), "Non translated string")
    }

    
}
