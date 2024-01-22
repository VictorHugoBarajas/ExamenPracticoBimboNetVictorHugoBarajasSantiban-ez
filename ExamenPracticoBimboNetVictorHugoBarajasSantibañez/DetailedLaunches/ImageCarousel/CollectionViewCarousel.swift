//
//  CollectionViewCarousel.swift
//  ExamenPracticoBimboNetVictorHugoBarajasSantibañez
//
//  Created by Victor Hugo Barajas Santibañez on 19/01/24.
//

import Foundation
import UIKit

class CollectionViewCarousel: UIView{
  
  var dataSource = [String]()
  
  var collectionViewCarrusel :UICollectionView = {
    var layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    
    var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collection.backgroundColor = .clear
    collection.translatesAutoresizingMaskIntoConstraints = false
    
    return collection
  }()
  
  init(dataSource : [String]){
    self.dataSource = dataSource
    super.init(frame: .zero)
    self.backgroundColor = .clear
    initUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func initUI(){
    collectionViewCarrusel.isPagingEnabled = true
    collectionViewCarrusel.delegate = self
    collectionViewCarrusel.dataSource = self
    collectionViewCarrusel.register(CollectionViewCellCarousel.self, forCellWithReuseIdentifier: "cell")
    
    self.addSubview(collectionViewCarrusel)
    NSLayoutConstraint.activate([collectionViewCarrusel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0), collectionViewCarrusel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0), collectionViewCarrusel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0), collectionViewCarrusel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0)])
  }
  
}

extension CollectionViewCarousel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    dataSource.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCellCarousel
    
    let info = dataSource[indexPath.item]
    cell.initUI(spaceXinfo : info)
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: width - 20  , height: height / 6)
  }
  
}

