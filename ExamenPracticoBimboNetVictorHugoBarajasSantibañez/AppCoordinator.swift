//
//  AppCoordinator.swift
//  ExamenPracticoBimboNetVictorHugoBarajasSantibañez
//
//  Created by Victor Hugo Barajas Santibañez on 18/01/24.
//

import Foundation
import UIKit


protocol Coordinator{
  var childCoordinator : [Coordinator] {get set}
  func startCoordinator()
}

class AppCoordinator : Coordinator{
  var childCoordinator: [Coordinator] = []
  var window : UIWindow
  
  init(window : UIWindow){
    self.window = window
  }
  
func startCoordinator() {
  let navigationController = UINavigationController()
  let startSplashCoordinator = SplashCoordinator(navigationController : navigationController)
  childCoordinator.append(startSplashCoordinator)
  startSplashCoordinator.startCoordinator()
  window.rootViewController = navigationController
  window.makeKeyAndVisible()
  }
  
}
