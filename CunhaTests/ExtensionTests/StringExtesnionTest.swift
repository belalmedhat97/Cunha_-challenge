//
//  StringExtesnionTest.swift
//  CunhaTests
//
//  Created by belal medhat on 03/09/2023.
//

import XCTest
@testable import Cunha
final class StringExtesnionTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown(){
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func test_string_to_date() {
        // given
        let date = "2023-09-03T15:12:13+0000"
        // when
        let convertedDate = date.toDate()
        // then
        XCTAssertNotNil(convertedDate)
    }
}
