//
//  GCDSchedulerFactory.swift
//  AppCoreKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation

public class GCDSchedulerFactory: SchedulerFactory {
    func serialScheduler(with name: String) -> Scheduler {
        GCDScheduler.serialScheduler(with: name)
    }
    
    func concurrentScheduler(with name: String) -> Scheduler {
        GCDScheduler.concurrentScheduler(with: name)
    }
    
    var mainThreadScheduler: Scheduler {
        GCDScheduler(dispatchQueue: DispatchQueue.main, name: "main")
    }
}


