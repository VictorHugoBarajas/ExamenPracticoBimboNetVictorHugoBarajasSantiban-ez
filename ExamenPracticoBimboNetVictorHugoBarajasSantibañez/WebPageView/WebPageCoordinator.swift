//
//  WebPageCoordinator.swift
//  ExamenPracticoBimboNetVictorHugoBarajasSantibañez
//
//  Created by Victor Hugo Barajas Santibañez on 21/01/24.
//

import Foundation
import UIKit


class  WebPageCoordinator : Coordinator{
  
  var childCoordinator: [Coordinator] = []
  var navigationController : UINavigationController
  var webPageInfo: LaunchesPastModel?
  
  init(navigationController : UINavigationController){
    self.navigationController = navigationController
  }
  
  
  func startCoordinator() {
    let view = WebPageViewController()
    let viewModel = WebPageViewModel()
    viewModel.webPageInfo = self.webPageInfo
    viewModel.coordinator = self
    view.viewModel = viewModel
    navigationController.pushViewController(view, animated: true)
  }
  
}

