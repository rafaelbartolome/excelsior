//
//  Scheduler.swift
//  ToolsKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation

public typealias SchedulerJob = ()->Void

/// Abstract API for scheduling async jobs.
/// Schedulers provide an abstract API to submits jobs that must be executed, usually in background.
/// The idea is to hide the underlying concurrency API (GDC, NSOperationQueues, etc.), and to be able to plug fully synchronous schedulers when needed (i.e. in tests).
public protocol Scheduler {
    var name: String { get }
    func scheduleAsync(_ job: @escaping SchedulerJob)
    func scheduleSync(_ job: @escaping SchedulerJob)
}

public extension Scheduler {
    func scheduleSyncTyped<T>(_ block: @escaping () -> T) -> T {
        var result: T?
        
        scheduleSync {
            result = block()
        }
        
        return result!
    }
}
