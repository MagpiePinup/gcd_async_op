//
//  AsyncAwaitBase.swift
//  GCD
//
//  Created by naveenkumar01 on 10/04/26.
//

import Foundation

class AsyncAwaitBase {
    
    enum DataError: Error {
        case noValue
    }
    
    func showFullName(first: String?, second: String?) async throws -> String {
        guard let first, let second else { throw DataError.noValue }
        return first + second
    }
    
    func checkForName() {
        Task {
            do {
                let fullName = try await showFullName(first: "Maya", second: "Queen")
            } catch(let error) {
                print(error.localizedDescription)
            }
        }
    }
}
