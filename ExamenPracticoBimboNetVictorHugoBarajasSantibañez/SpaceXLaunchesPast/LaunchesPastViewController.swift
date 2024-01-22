//
//  LaunchesPastViewController.swift
//  ExamenPracticoBimboNetVictorHugoBarajasSantibañez
//
//  Created by Victor Hugo Barajas Santibañez on 18/01/24.
//

import UIKit


class LaunchesPastViewController: UIViewController {
  
  var viewModel : LaunchesPastViewModel!
  var dataSource = [LaunchesPastModel]()
  
  var spaceBackground : UIImageView = {
    var image = UIImageView()
    image.image = UIImage(named: "fondo")
    image.contentMode = .scaleAspectFill
    image.translatesAutoresizingMaskIntoConstraints = false
    
    return image
  }()
  
  var launchesPastLabel : UILabel = {
    var label = UILabel()
    label.backgroundColor = .clear
    label.text = "Launches Past"
    label.font = UIFont(name: "Arial Bold", size: 25)
    label.textColor = .white
    label.translatesAutoresizingMaskIntoConstraints = false
    
    return label
  }()
  
  var collectionViewSpaceX : LaunchesPastCollectionView = {
    var collectionView = LaunchesPastCollectionView()
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    return collectionView
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(spaceBackground)
    getData()
    initUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationItem.hidesBackButton = true
  }
  
  func getData(){
    
    if let launchesPastModel = UserDefaults.standard.getDataSpaceX(){
      
      dataSource.append(contentsOf: launchesPastModel)
      collectionViewSpaceX.receiveData(dataSource: dataSource)
      
    }else{
      
      viewModel.delegate = self
      viewModel.getSpaceXLaunches()}
  }
  
  
  func initUI(){
    view.addSubview(launchesPastLabel)
    NSLayoutConstraint.activate([launchesPastLabel.widthAnchor.constraint(equalToConstant: 185), launchesPastLabel.heightAnchor.constraint(equalToConstant: 30), launchesPastLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10), launchesPastLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 85)])
    
    collectionViewSpaceX.delegate = self
    view.addSubview(collectionViewSpaceX)
    NSLayoutConstraint.activate([collectionViewSpaceX.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5), collectionViewSpaceX.topAnchor.constraint(equalTo: launchesPastLabel.bottomAnchor, constant: 10),collectionViewSpaceX.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5), collectionViewSpaceX.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5)])
    
    NSLayoutConstraint.activate([spaceBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0), spaceBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0), spaceBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: 0), spaceBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)])
    
  }
  
}


extension LaunchesPastViewController : LaunchesPastViewModelDelegate{
  
  func responseSuccess(response: [LaunchesPastModel]) {
    print("responseSucess\(response)")
    
    UserDefaults.standard.putDataSpaceX(launchesPastModel: response)
    
    if dataSource.isEmpty {
      dataSource.append(contentsOf: response)
      collectionViewSpaceX.receiveData(dataSource: dataSource)
    }
    
  }
  
  func responseError(error: Error) {
    print("responseError: \(error)")
  }
  
}


extension LaunchesPastViewController : LaunchesPastCollectionViewDelegate{
  
  func selectedLaunch(indexPath: IndexPath) {
    let info = dataSource[indexPath.item]
    viewModel.goToDetailedLaunches(infoVM: info)
  }
  
}
