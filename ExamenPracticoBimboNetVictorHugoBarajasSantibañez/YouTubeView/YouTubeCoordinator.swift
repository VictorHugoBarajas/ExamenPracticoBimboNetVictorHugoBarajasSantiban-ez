//
//  YouTubeCoordinator.swift
//  ExamenPracticoBimboNetVictorHugoBarajasSantibañez
//
//  Created by Victor Hugo Barajas Santibañez on 21/01/24.
//

import Foundation
import UIKit


class  YouTubeCoordinator : Coordinator{
  var childCoordinator: [Coordinator] = []
  var navigationController : UINavigationController
  var youTubeInfo: LaunchesPastModel?
  
  init(navigationController : UINavigationController){
    self.navigationController = navigationController
  }
  
  
  func startCoordinator() {
    let view = YouTubeViewController()
    let viewModel = YouTubeViewModel()
    viewModel.youTubeInfo = self.youTubeInfo
    viewModel.coordinator = self
    view.viewModel = viewModel
    navigationController.pushViewController(view, animated: true)
  }
  
}

