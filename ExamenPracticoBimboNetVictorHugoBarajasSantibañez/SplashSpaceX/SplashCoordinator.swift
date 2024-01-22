//
//  SplashCoordinator.swift
//  ExamenPracticoBimboNetVictorHugoBarajasSantibañez
//
//  Created by Victor Hugo Barajas Santibañez on 18/01/24.
//

import Foundation
import UIKit


class SplashCoordinator : Coordinator{
  
  var childCoordinator: [Coordinator] = []
  var navigationController : UINavigationController
  
  init(navigationController : UINavigationController){
    self.navigationController = navigationController
  }
  
  
  func startCoordinator() {
    let view = SplashViewController()
    let viewModel = SplashViewModel()
    viewModel.coordinator = self
    view.viewModel = viewModel
    navigationController.setViewControllers([view], animated: true)
  }
  
 
  func goToLaunchesPast(){
    let LaunchesCoordinator = LaunchesPastCoordinator(navigationController: navigationController)
    childCoordinator.append(LaunchesCoordinator)
    LaunchesCoordinator.startCoordinator()
  }
  
}

