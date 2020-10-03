//
//  ObserverForViewController.swift
//  Architecture
//
//  Created by Joshua Grant on 10/3/20.
//

import Foundation

class ObserverForViewController: Observer
{
    weak var eventResponder: ObserverForSceneUpdatesEventResponder? {
        willSet {
            if newValue == nil { stopObserving() }
        }
    }
    
    func startObserving()
    {
        startObservingSceneUpdates()
    }
    
    func stopObserving()
    {
        stopObservingSceneUpdates()
    }
    
    // MARK: - Subscriptions
    
    private func startObservingSceneUpdates()
    {
        let center = NotificationCenter.default
        
        center.addObserver(
            self,
            selector: #selector(sceneDidBecomeActive(_:)),
            name: .sceneDidBecomeActive,
            object: nil)
        
        center.addObserver(
            self,
            selector: #selector(sceneWillResignActive(_:)),
            name: .sceneWillResignActive,
            object: nil)
        
        center.addObserver(
            self,
            selector: #selector(sceneDidEnterBackground(_:)),
            name: .sceneDidEnterBackground,
            object: nil)
        
        center.addObserver(
            self,
            selector: #selector(sceneWillEnterForeground(_:)),
            name: .sceneWillEnterForeground,
            object: nil)
    }
    
    private func stopObservingSceneUpdates()
    {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Notification callbacks
    
    @objc func sceneDidBecomeActive(_ notification: Notification)
    {
        eventResponder?.sceneDidBecomeActive()
    }
    
    @objc func sceneWillResignActive(_ notification: Notification)
    {
        eventResponder?.sceneWillResignActive()
    }
    
    @objc func sceneDidEnterBackground(_ notification: Notification)
    {
        eventResponder?.sceneDidEnterBackground()
    }
    
    @objc func sceneWillEnterForeground(_ notification: Notification)
    {
        eventResponder?.sceneWillEnterForeground()
    }
}
