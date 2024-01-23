//
//  LaunchesPastCollectionViewCell.swift
//  ExamenPracticoBimboNetVictorHugoBarajasSantibañez
//
//  Created by Victor Hugo Barajas Santibañez on 18/01/24.
//

import Foundation
import UIKit
import SDWebImage


class LaunchesPastCollectionViewCell : UICollectionViewCell{
  
  var spaceXInfo : LaunchesPastModel?
  
  var missionImage : UIImageView = {
    var image = UIImageView()
    image.image = UIImage(named: "spaceX")
    image.backgroundColor = .clear
    image.clipsToBounds = true
    image.contentMode = .scaleAspectFit
    image.translatesAutoresizingMaskIntoConstraints = false
    
    return image
  }()
  
  var translucentView : UIView = {
    var view = UIView()
    view.layer.cornerRadius = height / 12.4
    view.translatesAutoresizingMaskIntoConstraints = false
    let translucentSystemBlue = UIColor.systemBlue.withAlphaComponent(0.3)
    view.backgroundColor = translucentSystemBlue
    view.clipsToBounds = true
    
    
    return view
  }()
  
  var missionLabel : UILabel = {
    var label = UILabel()
    label.backgroundColor = .clear
    label.numberOfLines = 0
    label.textColor = .white
    label.adjustsFontSizeToFitWidth = true
    label.font = UIFont(name: "Arial Bold", size: 20)
    label.translatesAutoresizingMaskIntoConstraints = false
    
    return label
  }()
  
  var launchPlaceLabel : UILabel = {
    var label = UILabel()
    label.backgroundColor = .clear
    label.numberOfLines = 0
    label.textColor = .white
    label.font = UIFont(name: "Arial", size: 15)
    label.translatesAutoresizingMaskIntoConstraints = false
    
    return label
  }()
  
  var dateLabel : UILabel = {
    var label = UILabel()
    label.backgroundColor = .clear
    label.textColor = .white
    label.font = UIFont(name: "Arial", size: 15)
    label.translatesAutoresizingMaskIntoConstraints = false
    
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    self.backgroundColor = .clear
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func initUI(spaceXinfo : LaunchesPastModel){
    self.spaceXInfo = spaceXinfo
    
    self.addSubview(translucentView)
    NSLayoutConstraint.activate([translucentView.widthAnchor.constraint(equalToConstant: height / 6.2), translucentView.heightAnchor.constraint(equalToConstant: height / 6.2), translucentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10), translucentView.centerYAnchor.constraint(equalTo: self.centerYAnchor)])
    
    let launchImage = spaceXinfo.links?.mission_patch
    if launchImage == nil{
      missionImage.layer.cornerRadius = height / 18
    }else{
      missionImage.sd_setImage(with: URL(string: (spaceXinfo.links?.mission_patch)!), placeholderImage: UIImage(named: "mision1"))
    }
    translucentView.addSubview(missionImage)
    NSLayoutConstraint.activate([missionImage.centerXAnchor.constraint(equalTo: translucentView.centerXAnchor), missionImage.centerYAnchor.constraint(equalTo: translucentView.centerYAnchor), missionImage.widthAnchor.constraint(equalToConstant: height / 9), missionImage.heightAnchor.constraint(equalToConstant: height / 9)])
    
    let missionName = spaceXinfo.mission_name
    if missionName == nil{
      missionLabel.text = "Unnamed Mision"
    }else{
      missionLabel.text = spaceXinfo.mission_name
    }
    self.addSubview(missionLabel)
    NSLayoutConstraint.activate([missionLabel.widthAnchor.constraint(equalToConstant: 200), missionLabel.heightAnchor.constraint(equalToConstant: 20), missionLabel.leadingAnchor.constraint(equalTo: translucentView.trailingAnchor, constant: 10), missionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20)])
    
    let launchSite = spaceXinfo.launch_site?.site_name
    if launchSite == nil{
      launchPlaceLabel.text = "unknown launch site"
    }else{
      launchPlaceLabel.text = spaceXinfo.launch_site?.site_name
    }
    self.addSubview(launchPlaceLabel)
    NSLayoutConstraint.activate([launchPlaceLabel.widthAnchor.constraint(equalToConstant: 200), launchPlaceLabel.heightAnchor.constraint(equalToConstant: 15), launchPlaceLabel.leadingAnchor.constraint(equalTo: translucentView.trailingAnchor, constant: 10), launchPlaceLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)])
    
    let dateLaunch = spaceXInfo?.launch_date_utc
    if dateLaunch == nil{
      dateLabel.text = "we don't know the date launch"
    }else{
      let newFormatDate = dateFormatter(date: (spaceXInfo?.launch_date_utc)!)
      dateLabel.text = newFormatDate}
    self.addSubview(dateLabel)
    NSLayoutConstraint.activate([dateLabel.widthAnchor.constraint(equalToConstant: 200), dateLabel.heightAnchor.constraint(equalToConstant: 15), dateLabel.leadingAnchor.constraint(equalTo: translucentView.trailingAnchor, constant: 10), dateLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -25)])
  }
  
  func dateFormatter(date : String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    dateFormatter.locale = Locale(identifier: "es_ES")
    if let date = dateFormatter.date(from: date) {
      let newDateFormatter = DateFormatter()
      newDateFormatter.dateFormat = "EEEE, MMM d, yyyy"
      newDateFormatter.locale = Locale(identifier: "es_ES")
      let formattedDate = newDateFormatter.string(from: date)
      print("formattedDate: \(formattedDate)")
      return formattedDate
    } else {
      print("Error")
    }
    
    return ""
  }
  
}

