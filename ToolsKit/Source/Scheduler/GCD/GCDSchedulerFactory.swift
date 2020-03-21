//
//  GCDSchedulerFactory.swift
//  ToolsKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation

public class GCDSchedulerFactory: SchedulerFactory {
    public init() {}
    
    public func serialScheduler(with name: String) -> Scheduler {
        GCDScheduler.serialScheduler(with: name)
    }
    
    public func concurrentScheduler(with name: String) -> Scheduler {
        GCDScheduler.concurrentScheduler(with: name)
    }
    
    public var mainThreadScheduler: Scheduler {
        GCDScheduler(dispatchQueue: DispatchQueue.main, name: "main")
    }
}


