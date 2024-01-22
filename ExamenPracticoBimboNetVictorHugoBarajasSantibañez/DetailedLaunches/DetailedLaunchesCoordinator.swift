//
//  DetailedLaunchesCoordinator.swift
//  ExamenPracticoBimboNetVictorHugoBarajasSantibañez
//
//  Created by Victor Hugo Barajas Santibañez on 19/01/24.
//

import Foundation
import UIKit

class DetailedLaunchesCoordinator : Coordinator{
  
  var childCoordinator: [Coordinator] = []
  var navigationController : UINavigationController
  var detailedInfo: LaunchesPastModel?
  
  init(navigationController : UINavigationController){
    self.navigationController = navigationController
  }
  
  
  func startCoordinator() {
    
    let view = DetailedLaunchesViewController()
    let viewModel = DetailedLaunchesViewModel()
    viewModel.detailedInfo = self.detailedInfo
    viewModel.coordinator = self
    view.viewModel = viewModel
    navigationController.pushViewController(view, animated: true)
  }
  
  func goToYouTube(){
    let coordinatorYouTube = YouTubeCoordinator(navigationController: navigationController)
    coordinatorYouTube.youTubeInfo = self.detailedInfo
    childCoordinator.append(coordinatorYouTube)
    coordinatorYouTube.startCoordinator()
  }
  
  func goToWebPage(){
    let coordinatorWebPage = WebPageCoordinator(navigationController: navigationController)
    coordinatorWebPage.webPageInfo = self.detailedInfo
    childCoordinator.append(coordinatorWebPage)
    coordinatorWebPage.startCoordinator()
  }
}
