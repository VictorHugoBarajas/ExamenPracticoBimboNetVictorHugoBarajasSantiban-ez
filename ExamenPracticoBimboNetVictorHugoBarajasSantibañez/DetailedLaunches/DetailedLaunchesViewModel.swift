//
//  DetailedLaunchesViewModel.swift
//  ExamenPracticoBimboNetVictorHugoBarajasSantibañez
//
//  Created by Victor Hugo Barajas Santibañez on 19/01/24.
//

import Foundation
import UIKit

class DetailedLaunchesViewModel {
  
  var coordinator : DetailedLaunchesCoordinator!
  var detailedInfo : LaunchesPastModel?
  
  func goToYouTube(){
    coordinator.goToYouTube()
  }
  func goToWebPage(){
    coordinator.goToWebPage()
  }
}
