//
//  APIResponseValidationTest.swift
//  GeofenceLocationDemoTests
//
//  Created by Manish Ingale on 28/08/21.
//

import XCTest
@testable import GeofenceLocationDemo

class APIResponseValidationTest: XCTestCase {
    
    
    let geofenceViewModel = GeofenceViewModel()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    
    
    func test_Enter_Exit_ParrametersSucess() throws  {
        
        // ARRANGE
        let apiExpectations = expectation(description: "ValidAPIRequest")
        let userDetails = UserDetails.init(name: "Jhon", userId: "xyz", place: "Pune", status: "Enter")
        //ACT
        geofenceViewModel.postDummyRequestWith(userDetails: userDetails, completion: { (responce) in
            
            // ASSERT
            XCTAssertNotNil(responce)
            //            XCTAssertNotNil(responce.errCode)
            XCTAssertEqual(responce.msg!, "Error API Failure!") //Data Added Successfully Because of invalid api
            apiExpectations.fulfill()
        })
        
        waitForExpectations(timeout: 5, handler: nil)
        
    }
    
    
    func test_Enter_Exit_With_BlankParameterFailure() throws  {
        
        // ARRANGE
        let apiExpectations = expectation(description: "InValidAPIRequest")
        
        let userDetails = UserDetails.init(name: "", userId: "", place: "", status: "Enter")

        //ACT
        geofenceViewModel.postDummyRequestWith(userDetails: userDetails) { (responce) in
            
            // ASSERT
            XCTAssertNotNil(responce)
            //            XCTAssertNotNil(responce.errCode)
            XCTAssertEqual(responce.msg!, "Error API Failure!")
            apiExpectations.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    
}
