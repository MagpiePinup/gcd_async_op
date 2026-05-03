//
//  DispatchQueueBase.swift
//  GCD
//
//  Created by naveenkumar01 on 10/04/26.
//

import Foundation

class DispatchQueueBase {
    
    func serialQueue() {
        let serialQueue = DispatchQueue(label: "com.app.mycomp", qos: .background)
        serialQueue.async {
            print("Hello dispatch 1")
        }
        serialQueue.async {
            print("Hello dispatch 2")
        }
    }
    
    func concurrentQueue() {
        let concQueue = DispatchQueue(label: "com.app.myComy", qos: .userInitiated, attributes: .concurrent)
        concQueue.async {
            print("Concurrent queue")
        }
        concQueue.async {
            print("Jill queue")
        }
    }
    
    func mainQueue() {
        DispatchQueue.main.async {
            print("Main thread")
        }
    }
    
    func globalQueue() {
        DispatchQueue.global().async {
            print("Global concurrent queue")
        }
    }
}
