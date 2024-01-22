//
//  LaunchesPastCollectionView.swift
//  ExamenPracticoBimboNetVictorHugoBarajasSantibañez
//
//  Created by Victor Hugo Barajas Santibañez on 18/01/24.
//

import Foundation
import UIKit


let width = UIScreen.main.bounds.width
let height = UIScreen.main.bounds.height

protocol LaunchesPastCollectionViewDelegate{
  func selectedLaunch(indexPath : IndexPath)
}

class LaunchesPastCollectionView : UIView{
  
  var delegate : LaunchesPastCollectionViewDelegate?
  var dataSource = [LaunchesPastModel]()
  
  var collectionViewLaunchesPast :UICollectionView = {
    var layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    
    var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collection.backgroundColor = .clear
    collection.translatesAutoresizingMaskIntoConstraints = false
    
    return collection
  }()
  
  
  init(){
    super.init(frame: .zero)
    initUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  func initUI(){
    collectionViewLaunchesPast.delegate = self
    collectionViewLaunchesPast.dataSource = self
    collectionViewLaunchesPast.register(LaunchesPastCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    self.addSubview(collectionViewLaunchesPast)
    NSLayoutConstraint.activate([collectionViewLaunchesPast.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0), collectionViewLaunchesPast.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0), collectionViewLaunchesPast.topAnchor.constraint(equalTo: self.topAnchor, constant: 0), collectionViewLaunchesPast.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0)])
  }
  
  func receiveData(dataSource: [LaunchesPastModel]){
    self.dataSource = dataSource
    collectionViewLaunchesPast.reloadData()
  }
  
}

extension LaunchesPastCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    dataSource.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LaunchesPastCollectionViewCell
    
    let info = dataSource[indexPath.item]
    cell.initUI(spaceXinfo : info)
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    return CGSize(width: width - 20  , height: height / 6)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    delegate?.selectedLaunch(indexPath: indexPath)
  }
  
}
