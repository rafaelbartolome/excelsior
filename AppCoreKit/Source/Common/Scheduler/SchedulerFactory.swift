//
//  SchedulerFactory.swift
//  AppCoreKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation

protocol SchedulerFactory {
    func serialScheduler(with name: String) -> Scheduler
    func concurrentScheduler(with name: String) -> Scheduler
    var mainThreadScheduler: Scheduler { get }
}
