//
//  FullySynchronousScheduler.swift
//  ToolsKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation

/// Fully Synchronous Scheduler meant to be used in tests
/// Just executes the scheduled jobs immediately, and in the thread used by the caller. The idea is to execute all the testing code synchronously in the main thread.

public class FullySynchronousScheduler {
    let _name: String
    public init(name: String) {
        _name = name
    }
}

extension FullySynchronousScheduler: Scheduler {
    public var name: String {
        _name
    }
    
    public func scheduleAsync(_ job: @escaping SchedulerJob) {
        job()
    }
    
    public func scheduleSync(_ job: @escaping SchedulerJob) {
        job()
    }
}
