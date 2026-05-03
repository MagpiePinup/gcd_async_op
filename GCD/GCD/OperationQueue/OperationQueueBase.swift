//
//  OperationQueueBase.swift
//  GCD
//
//  Created by naveenkumar01 on 10/04/26.
//

// Simple Operation Queue

import Foundation

struct OperationQueueBase {
    
    private let opQueue = OperationQueue()
    
    func createOperationQueue() {
        opQueue.maxConcurrentOperationCount = 2
        opQueue.qualityOfService = .userInitiated
        
        let op1 = BlockOperation {
            print("Hello Block 1")
            OperationQueue.main.addOperation {
                print("Mike main thread")
            }
        }
        let op2 = BlockOperation {
            print("Hello World 2")
            DispatchQueue.main.async {
                print("Main thread")
            }
        }
        op2.queuePriority = .low
        op1.addDependency(op2)
        opQueue.addOperations([op1, op2], waitUntilFinished: true)
    }
}
