//
//  FullySynchronousSchedulerFactory.swift
//  AppCoreKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation

/// Factory for Fully Synchronous Schedulers
/// To be used in test to avoid concurrent test
public class FullySynchronousSchedulerFactory: SchedulerFactory {
    public init() {}
    
    func serialScheduler(with name: String) -> Scheduler {
        FullySynchronousScheduler(name: name)
    }
    
    func concurrentScheduler(with name: String) -> Scheduler {
         FullySynchronousScheduler(name: name)
    }
    
    var mainThreadScheduler: Scheduler {
         FullySynchronousScheduler(name: "main")
    }
}
