//
//  DateExtensionTest.swift
//  CunhaTests
//
//  Created by belal medhat on 03/09/2023.
//

import XCTest
@testable import Cunha

final class DateExtensionTest: XCTestCase {

    override func setUp(){
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown(){
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func test_date_to_String() {
        // given
        let date = Date()
        // when
        let convertedDate = date.toString()
        // then
        XCTAssertNotNil(convertedDate)
    }
}
