//
//  SplashViewController.swift
//  ExamenPracticoBimboNetVictorHugoBarajasSantibañez
//
//  Created by Victor Hugo Barajas Santibañez on 18/01/24.
//

import UIKit

class SplashViewController: UIViewController {
  
  var viewModel : SplashViewModel!
  
  var imageSplash : UIImageView = {
    var image = UIImageView()
    image.image = UIImage(named: "spaceX")
    image.translatesAutoresizingMaskIntoConstraints = false
    image.contentMode = .scaleAspectFit
    
    return image
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .black
    initUI()
    setUpTimer()
  }
  
  
  func initUI(){
    view.addSubview(imageSplash)
    NSLayoutConstraint.activate([
      imageSplash.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      imageSplash.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      imageSplash.widthAnchor.constraint(equalTo: view.widthAnchor),
      imageSplash.heightAnchor.constraint(equalTo: view.heightAnchor)])
  }
  
  
  func setUpTimer(){
    Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(goToLaunchesPast), userInfo: nil, repeats: false)
  }
  
  
  @objc func goToLaunchesPast() {
    viewModel.goToLaunchesPast()
  }
  
}
