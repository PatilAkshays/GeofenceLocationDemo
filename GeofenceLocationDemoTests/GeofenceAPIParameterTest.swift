//
//  GeofenceAPIParameterTest.swift
//  GeofenceLocationDemoTests
//
//  Created by Manish Ingale on 28/08/21.
//

import XCTest
@testable import GeofenceLocationDemo

class GeofenceAPIParameterTest: XCTestCase {
    
      
      func test_ParameterValidation_With_EmptyStrings_Returns_ValidationFailure(){

          // ARRANGE
          let request = UserDetails.init(name: "", userId: "", place: "", status: "")

          // ACT
          let result = Validation().validateApiParameter(userDetails: request)

          // ASSERT
          XCTAssertFalse(result.success)
          XCTAssertNotNil(result.errorMessage)
          XCTAssertEqual(result.errorMessage, "User Name, userID cannot be empty")

      }
      
      
      func test_ParameterValidation_With_EmptyNameStrings_Returns_ValidationFailure(){

          // ARRANGE
          let request = UserDetails.init(name: "", userId: "xyz", place: "Pune", status: "Enter")

          // ACT
          let result = Validation().validateApiParameter(userDetails: request)

          // ASSERT
          XCTAssertFalse(result.success)
          XCTAssertNotNil(result.errorMessage)
          XCTAssertEqual(result.errorMessage, "User Name cannot be empty")

      }
      
      func test_ParameterValidation_With_EmptyUserIDStrings_Returns_ValidationFailure(){

          // ARRANGE
          let request = UserDetails.init(name: "Jhon", userId: "", place: "Pune", status: "Enter")

          // ACT
          let result = Validation().validateApiParameter(userDetails: request)

          // ASSERT
          XCTAssertFalse(result.success)
          XCTAssertNotNil(result.errorMessage)
          XCTAssertEqual(result.errorMessage, "User Id cannot be empty")

      }
      
      func test_ParameterValidation_With_EmptyPlaceNameStrings_Returns_ValidationFailure(){

          // ARRANGE
          let request = UserDetails.init(name: "Jhon", userId: "xyz", place: "", status: "Enter")

          // ACT
          let result = Validation().validateApiParameter(userDetails: request)

          // ASSERT
          XCTAssertFalse(result.success)
          XCTAssertNotNil(result.errorMessage)
          XCTAssertEqual(result.errorMessage, "Place name cannot be empty")

      }
      
      func test_ParameterValidation_With_EmptyPlaceNameStrings_Returns_ValidationSuccess(){

          // ARRANGE
          let request = UserDetails.init(name: "Jhon", userId: "xyz", place: "Pune", status: "Enter")

          // ACT
          let result = Validation().validateApiParameter(userDetails: request)

          // ASSERT
          XCTAssertTrue(result.success)
          XCTAssertNil(result.errorMessage)

      }

}
