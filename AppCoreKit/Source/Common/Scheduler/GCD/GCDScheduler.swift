//
//  GCDScheduler.swift
//  AppCoreKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation

/// Scheduler based on GCD queues.

public class GCDScheduler {
    private let _name: String
    private let queue: DispatchQueue
    
    init(dispatchQueue: DispatchQueue,
         name: String) {
        queue = dispatchQueue
        _name = name
    }
    
    static func serialScheduler(with name: String) -> Scheduler {
        let dispatchQueue = DispatchQueue.init(label: name,
                                               qos: .default)
        
        return GCDScheduler(dispatchQueue: dispatchQueue, name: name)
    }
    
    static func concurrentScheduler(with name: String) -> Scheduler {
        let dispatchQueue = DispatchQueue.init(label: name,
                                               qos: .default,
                                               attributes: .concurrent)
        
        return GCDScheduler(dispatchQueue: dispatchQueue, name: name)
    }
}

extension GCDScheduler: Scheduler {
    public var name: String {
        _name
    }
    
    public func scheduleAsync(_ job: @escaping SchedulerJob) {
        queue.async {
            job()
        }
    }
    
    public func scheduleSync(_ job: @escaping SchedulerJob) {
        queue.sync {
            job()
        }
    }
}
