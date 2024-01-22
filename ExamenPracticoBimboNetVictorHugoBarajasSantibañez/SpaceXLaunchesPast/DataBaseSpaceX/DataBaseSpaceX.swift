//
//  DataBaseSpaceX.swift
//  ExamenPracticoBimboNetVictorHugoBarajasSantibañez
//
//  Created by Victor Hugo Barajas Santibañez on 19/01/24.
//

import Foundation


extension UserDefaults{
  
  
  func putDataSpaceX(launchesPastModel : [LaunchesPastModel]){
    let jsonEncoder = JSONEncoder()
    if let launchesPastModelEncode = try? jsonEncoder.encode(launchesPastModel){
      self.set(launchesPastModelEncode, forKey: "launchesPastModel")
    }
  }
  
  
  func getDataSpaceX() -> [LaunchesPastModel]?{
    if let data = self.data(forKey: "launchesPastModel"){
      let jsonDecoder = JSONDecoder()
      if let launchesPastModel = try? jsonDecoder.decode([LaunchesPastModel].self, from: data){
        return launchesPastModel
      }else{
        print("error decoding launchesPastModel")
        return nil
      }
    }else{
      print("Error getting launchesPastModel")
      return nil
    }
  }
  
  
  func deleteDataSpaceX(){
    self.removeObject(forKey: "LaunchesPastModel")
  }
  
}
