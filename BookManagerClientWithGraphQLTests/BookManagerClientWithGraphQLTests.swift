//
//  BookManagerClientWithGraphQLTests.swift
//  BookManagerClientWithGraphQLTests
//
//  Created by Iichiro Kawashima on 2020/02/26.
//  Copyright © 2020 Iichiro Kawashima. All rights reserved.
//

import XCTest
@testable import BookManagerClientWithGraphQL

class BookManagerClientWithGraphQLTests: XCTestCase {

    private let client = GithubAPIClient.shared

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGithubv4API() {

        let exp = expectation(description: "Success")

        client.fetchUserFromGithub { (result) in
            switch result {
            case .success(let res):
                debugPrint(res!)
                exp.fulfill()

            case .failure(let err):
                print(err.localizedDescription)
                XCTAssertFalse(false)
            }
        }

        wait(for: [exp], timeout: 30.0)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
