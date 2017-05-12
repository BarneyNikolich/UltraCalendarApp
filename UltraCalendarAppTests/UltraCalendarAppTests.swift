//
//  UltraCalendarAppTests.swift
//  UltraCalendarAppTests
//
//  Created by Barney Nikolich on 03/04/2017.
//  Copyright © 2017 Barney Nikolich. All rights reserved.
//

import XCTest
@testable import UltraCalendarApp

class UltraCalendarAppTests: XCTestCase {
  
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    
    //MARK: Race Class Tests
    
    //confirm the race initialiser returns Race object with valid initialisers
    func testRaceInitialiserSucceeds(){
        
        //26 distance and name provided
        let marathonDistance = Race.init(name: "test race", logo: nil, distance: 27, climb: 3000, cost: 30, location: "Yorkshire", date: "12/12/12", info: "")
        XCTAssertNotNil(marathonDistance)
        
    }
    
    func testRaceInitialiserFails(){
        //Distance less than ulta
        let tooSmallDistance = Race.init(name: "test", logo: nil, distance: 25, climb: 3000, cost: 30, location: "Yorkshire", date: "12/12/12", info: "")
        XCTAssertNil(tooSmallDistance)
        
        //Empty String
        let emptyNameString = Race.init(name: "", logo: nil, distance: 30, climb: 3000, cost: 30, location: "Yorkshire", date: "12/12/12", info: "")
        XCTAssertNil(emptyNameString)
    }
    
    
}
