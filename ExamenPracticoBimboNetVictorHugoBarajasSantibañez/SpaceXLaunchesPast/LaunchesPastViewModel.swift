//
//  LaunchesPastViewModel.swift
//  ExamenPracticoBimboNetVictorHugoBarajasSantibañez
//
//  Created by Victor Hugo Barajas Santibañez on 18/01/24.
//

import Foundation
import Alamofire


protocol LaunchesPastViewModelDelegate{
  
  func responseSuccess(response : [LaunchesPastModel])
  func responseError(error : Error)
}

class LaunchesPastViewModel{
  
  var coordinator: LaunchesPastCoordinator!
  var delegate: LaunchesPastViewModelDelegate?
  
  func getSpaceXLaunches() {
    
    let urlString = "https://api.spacexdata.com/v3/launches/past"
    
    AF.request(urlString, method: .get).response { response in
      switch response.result {
      case .success(let data):
        do {
          let launchesPastModelObject = try JSONDecoder().decode([LaunchesPastModel].self, from: data!)
          print("This is the object \(launchesPastModelObject)")
          self.delegate?.responseSuccess(response: launchesPastModelObject)
        } catch {
          print(error.localizedDescription)
          self.delegate?.responseError(error: error)
        }
      case .failure(let error):
        print(error.localizedDescription)
        self.delegate?.responseError(error: error)
      }
    }
  }
  
  func goToDetailedLaunches(infoVM : LaunchesPastModel){
    coordinator.goToDetailedLaunches(infoC: infoVM)
  }
}
