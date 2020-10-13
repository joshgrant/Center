//
//  Observer.swift
//  Architecture
//
//  Created by Joshua Grant on 10/3/20.
//

import Foundation

/// Observers are objects that view controllers use to receive external events.
/// The main point of an observer is to decouple view controllers from event systems.
/// These events are input signals to view controllers.
///
/// Observers can:
/// * Subscribe to events
/// * Process events
/// * Deliver processed events to view controllers
///
/// Create an observer class for each view controller that needs to observe external events.
/// These observers are created with references to the systems that emit events.
/// Observers are injected into their view controllers.
///
/// Observers call methods on their (weak) delegates, which are typically view controllers, type `EventResponder`.
///
/// The `EventResponder` calls `startObserving()` on the observer to begin notifications.
///
/// The `EventResponder` calls `stopObserving()` on the observer to begin notifications.
protocol Observer
{
    func startObserving()
    func stopObserving()
}

protocol EventResponder: class { }
