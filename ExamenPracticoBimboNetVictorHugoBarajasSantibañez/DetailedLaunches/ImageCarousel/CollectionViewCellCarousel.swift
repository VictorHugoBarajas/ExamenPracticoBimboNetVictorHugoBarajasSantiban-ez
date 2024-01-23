//
//  CollectionViewCellCarousel.swift
//  ExamenPracticoBimboNetVictorHugoBarajasSantibañez
//
//  Created by Victor Hugo Barajas Santibañez on 19/01/24.
//

import Foundation
import UIKit

class CollectionViewCellCarousel: UICollectionViewCell {
  
  var spaceXInfo : String?
  
  var shipImage : UIImageView = {
    var image = UIImageView()
    image.clipsToBounds = true
    image.layer.cornerRadius = 15
    image.contentMode = .scaleToFill
    image.image = UIImage(named: "spaceX")
    image.translatesAutoresizingMaskIntoConstraints = false
    
    return image
  }()
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    self.backgroundColor = .clear
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func initUI(spaceXinfo : String){
    
    self.spaceXInfo = spaceXinfo
    shipImage.sd_setImage(with:URL(string: spaceXinfo), placeholderImage: UIImage(named: "spaceX") )
    
    self.addSubview(shipImage)
    NSLayoutConstraint.activate([shipImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0), shipImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0), shipImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0), shipImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)])
    
  }
  
}
