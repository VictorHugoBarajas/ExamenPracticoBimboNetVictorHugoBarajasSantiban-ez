//
//  AppDelegate.swift
//  ExamenPracticoBimboNetVictorHugoBarajasSantibañez
//
//  Created by Victor Hugo Barajas Santibañez on 18/01/24.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var appCoordinator : AppCoordinator?
    
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

      window = UIWindow(frame: UIScreen.main.bounds)
      appCoordinator = AppCoordinator(window: window!)
      appCoordinator?.startCoordinator()
      return true
    }


}

