//
//  AddLatiLongTest.swift
//  GeofenceLocationDemoTests
//
//  Created by Manish Ingale on 28/08/21.
//

import XCTest
@testable import GeofenceLocationDemo

class AddLatiLongTest: XCTestCase {
    
    
    func test_ParameterValidation_With_Returns_ValidationSucess(){

        // ARRANGE
        let result = Validation().validateLocationParameter(location: "Pune", latitude: "18.7640", longitude: "72.6777", radius: "20")

        // ACTs
        XCTAssertTrue(result.success)
        XCTAssertNil(result.errorMessage)

    }
    
    func test_ParameterValidation_With_EmptyStrings_Returns_ValidationFailure(){

        // ARRANGE
        let result = Validation().validateLocationParameter(location: "", latitude: "", longitude: "", radius: "")

        // ACT
        XCTAssertFalse(result.success)
        XCTAssertNotNil(result.errorMessage)
        XCTAssertEqual(result.errorMessage, "Location, Latitude, Longitude & Radius Fields cannot be empty")

    }
    
    
    func test_ParameterValidation_With_EmptyLocationStrings_Returns_ValidationFailure(){

        // ACT
        let result = Validation().validateLocationParameter(location: "", latitude: "15.0000", longitude: "12.0000", radius: "20")

        // ASSERT
        XCTAssertFalse(result.success)
        XCTAssertNotNil(result.errorMessage)
        XCTAssertEqual(result.errorMessage, "Location Field cannot be empty")

    }
    
    func test_ParameterValidation_With_EmptyLatitudeStrings_Returns_ValidationFailure(){

        // ACT
        let result = Validation().validateLocationParameter(location: "Pune", latitude: "", longitude: "12.0000", radius: "20")

        // ASSERT
        XCTAssertFalse(result.success)
        XCTAssertNotNil(result.errorMessage)
        XCTAssertEqual(result.errorMessage, "Latitude Field cannot be empty")

    }
    
    func test_ParameterValidation_With_EmptyLongitudeStrings_Returns_ValidationFailure(){

        // ACT
        let result = Validation().validateLocationParameter(location: "Pune", latitude: "12.0000", longitude: "", radius: "20")

        // ASSERT
        XCTAssertFalse(result.success)
        XCTAssertNotNil(result.errorMessage)
        XCTAssertEqual(result.errorMessage, "Longitude Field cannot be empty")

    }
    
    func test_ParameterValidation_With_EmptyRadiusStrings_Returns_ValidationFailure(){

        // ACT
        let result = Validation().validateLocationParameter(location: "Pune", latitude: "12.0000", longitude: "18.0000", radius: "")

        // ASSERT
        XCTAssertFalse(result.success)
        XCTAssertNotNil(result.errorMessage)
        XCTAssertEqual(result.errorMessage, "Radius Field cannot be empty")

    }
    
    func test_ParameterValidation_With_InvalidLatitudeStrings_Returns_ValidationFailure(){

        // ACT
        let result = Validation().validateLocationParameter(location: "Pune", latitude: "xyz", longitude: "72.6777", radius: "20")

        // ASSERT
        XCTAssertFalse(result.success)
        XCTAssertNotNil(result.errorMessage)
        XCTAssertEqual(result.errorMessage, "Latitude Field cannot be character. it should be integer or double value")

    }
    
    func test_ParameterValidation_With_InvalidLongitudeStrings_Returns_ValidationFailure(){

        // ACT
        let result = Validation().validateLocationParameter(location: "Pune", latitude: "72.6777", longitude: "xyz", radius: "20")

        // ASSERT
        XCTAssertFalse(result.success)
        XCTAssertNotNil(result.errorMessage)
        XCTAssertEqual(result.errorMessage, "Longitude Field cannot be character. it should be integer or double value")

    }
    
    func test_ParameterValidation_With_InvalidRadiusStrings_Returns_ValidationFailure(){

        // ACT
        let result = Validation().validateLocationParameter(location: "Pune", latitude: "18.8765", longitude: "72.6777", radius: "cjhdbcdf")

        // ASSERT
        XCTAssertFalse(result.success)
        XCTAssertNotNil(result.errorMessage)
        XCTAssertEqual(result.errorMessage, "Radius Field cannot be character. it should be a Number")

    }
    

}
