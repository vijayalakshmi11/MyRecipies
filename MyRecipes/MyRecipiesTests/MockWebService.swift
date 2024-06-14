//
//  MockWebService.swift
//  MyRecipiesTests
//
//  Created by Vijaya Lakshmi on 6/12/24.
//

import Foundation
@testable import MyRecipies
class MockWebService: WebServiceProtocol {
    var response: Data?
    var error: Error?

    func get<T: Decodable>(url: URL, parse: (Data) -> T?) async throws -> T {
        if let error = error {
            throw error
        }
        guard let jsonData = response else {
            throw NetworkError.noData
        }
        guard let result = parse(jsonData) else {
            throw NetworkError.decodingError
        }
        return result
    }
}
