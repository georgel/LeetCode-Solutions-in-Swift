//
//  Easy_008_String_to_Integer_atoi_Test.swift
//  Solutions
//
//  Created by Wu, Di on 3/27/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Easy_008_String_to_Integer_atoi_Test: XCTestCase {

    private static let ProblemName: String = "Easy_008_String_to_Integer_atoi"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value

    func test_001() {
        var input: String = "123"
        var expected: Int = 123
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        var input: String = "     123"
        var expected: Int = 123
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        var input: String = "    +123"
        var expected: Int = 123
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        var input: String = "-123"
        var expected: Int = -123
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        var input: String = "    -123"
        var expected: Int = -123
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        var input: String = String(Int.max)
        var expected: Int = 9223372036854775807
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        var input: String = "  9223372036854775808"
        var expected: Int = 9223372036854775807
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        var input: String = "  9223372036854775806"
        var expected: Int = 9223372036854775806
        asyncHelper(input: input, expected: expected)
    }
    func test_009() {
        var input: String = String(Int.min)
        var expected: Int = -9223372036854775808
        asyncHelper(input: input, expected: expected)
    }
    func test_010() {
        var input: String = " -9223372036854775809"
        var expected: Int = -9223372036854775808
        asyncHelper(input: input, expected: expected)
    }
    func test_011() {
        var input: String = " -9223372036854775806"
        var expected: Int = -9223372036854775806
        asyncHelper(input: input, expected: expected)
    }
    func test_012() {
        var input: String = "   123-   "
        var expected: Int = 123
        asyncHelper(input: input, expected: expected)
    }
    func asyncHelper(# input: String, expected: Int ) {
        var expectation: XCTestExpectation = self.expectationWithDescription(Easy_008_String_to_Integer_atoi_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            var result: Int = Easy_008_String_to_Integer_atoi.atoi(input)
            assertHelper(result == expected, problemName: Easy_008_String_to_Integer_atoi_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            expectation.fulfill()
        })
        waitForExpectationsWithTimeout(Easy_008_String_to_Integer_atoi_Test.TimeOut) { (error: NSError!) -> Void in
            if error != nil {
                assertHelper(false, problemName: Easy_008_String_to_Integer_atoi_Test.ProblemName, input: input, resultValue: Easy_008_String_to_Integer_atoi_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}

/*
atoi("123")                     //123
atoi("     123")                //123
atoi("    +123")                //123
atoi("-123")                    //-123
atoi("    -123")                //-123
atoi(String(Int.max))           //9223372036854775807
atoi("  9223372036854775808")   //9223372036854775807, overflow
atoi("  9223372036854775806")   //9223372036854775806
atoi(String(Int.min))           //-9223372036854775808
atoi(" -9223372036854775809")   //9223372036854775808, overflow
atoi(" -9223372036854775806")   //-9223372036854775806
*/