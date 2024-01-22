//
//  LaunchesPastCoordinator.swift
//  ExamenPracticoBimboNetVictorHugoBarajasSantibañez
//
//  Created by Victor Hugo Barajas Santibañez on 18/01/24.
//

import Foundation
import UIKit


class LaunchesPastCoordinator : Coordinator{
  
  var childCoordinator: [Coordinator] = []
  var navigationController : UINavigationController
  var dataSource = [LaunchesPastModel]()
  
  init(navigationController : UINavigationController){
    self.navigationController = navigationController
  }
  
  func startCoordinator() {
    let view = LaunchesPastViewController()
    let viewModel = LaunchesPastViewModel()
    viewModel.coordinator = self
    view.viewModel = viewModel
    navigationController.pushViewController(view, animated: true)
  }
  
  
  func goToDetailedLaunches(infoC : LaunchesPastModel){
    
    let coordinatorDetailedLaunches = DetailedLaunchesCoordinator(navigationController:navigationController)
    coordinatorDetailedLaunches.detailedInfo = infoC
    childCoordinator.append(coordinatorDetailedLaunches)
    coordinatorDetailedLaunches.startCoordinator()
  }
  
}
