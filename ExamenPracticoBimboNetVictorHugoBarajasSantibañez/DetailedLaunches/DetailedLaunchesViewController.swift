//
//  DetailedLaunchesViewController.swift
//  ExamenPracticoBimboNetVictorHugoBarajasSantibañez
//
//  Created by Victor Hugo Barajas Santibañez on 19/01/24.
//
import Foundation
import UIKit


class DetailedLaunchesViewController: UIViewController {
  
  var spaceXInfo : LaunchesPastModel?
  var viewModel : DetailedLaunchesViewModel!
  var collectionViewCarrusel : CollectionViewCarousel?
  
  var spaceBackground : UIImageView = {
    var image = UIImageView()
    image.image = UIImage(named: "fondo")
    image.contentMode = .scaleAspectFill
    image.translatesAutoresizingMaskIntoConstraints = false
    
    return image
  }()
  
  var elonImage : UIImageView = {
    var image = UIImageView()
    image.image = UIImage(named: "elon")
    image.contentMode = .scaleAspectFill
    image.translatesAutoresizingMaskIntoConstraints = false
    
    return image
  }()
  
  var yodaImage : UIImageView = {
    var image = UIImageView()
    image.image = UIImage(named: "yoda")
    image.contentMode = .scaleAspectFill
    image.translatesAutoresizingMaskIntoConstraints = false
    
    return image
  }()
  
  var halImage : UIImageView = {
    var image = UIImageView()
    image.image = UIImage(named: "hal")
    image.contentMode = .scaleAspectFill
    image.translatesAutoresizingMaskIntoConstraints = false
    
    return image
  }()
  
  var alienImage : UIImageView = {
    var image = UIImageView()
    image.image = UIImage(named: "alien")
    image.contentMode = .scaleAspectFill
    image.translatesAutoresizingMaskIntoConstraints = false
    
    return image
  }()
  
  var detailsLabel : UILabel = {
    var label = UILabel()
    label.backgroundColor = .clear
    label.textColor = .white
    label.text = "Details"
    label.font = UIFont(name: "Copperplate", size: 40)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    
    return label
  }()
  
  var dateLabel : UILabel = {
    var label = UILabel()
    label.backgroundColor = .clear
    label.textColor = .white
    label.numberOfLines = 0
    label.adjustsFontSizeToFitWidth = true
    label.font = UIFont(name: "Copperplate", size: 20)
    label.translatesAutoresizingMaskIntoConstraints = false
    
    return label
  }()
  
  var siteTLabel : UILabel = {
    var label = UILabel()
    label.backgroundColor = .clear
    label.textColor = .white
    label.numberOfLines = 0
    label.font = UIFont(name: "Copperplate", size: 20)
    label.adjustsFontSizeToFitWidth = true
    label.translatesAutoresizingMaskIntoConstraints = false
    
    return label
  }()
  
  var rocketNameLabel: UILabel = {
    var label = UILabel()
    label.backgroundColor = .clear
    label.textColor = .white
    label.font = UIFont(name: "Copperplate", size: 20)
    label.translatesAutoresizingMaskIntoConstraints = false
    
    return label
  }()
  
  var rocketTypeLabel: UILabel = {
    var label = UILabel()
    label.backgroundColor = .clear
    label.textColor = .white
    label.font = UIFont(name: "Copperplate", size: 20)
    label.translatesAutoresizingMaskIntoConstraints = false
    
    return label
  }()
  
  var launchDetailsLabel: UILabel = {
    var label = UILabel()
    label.textColor = .white
    label.numberOfLines = 0
    label.textAlignment = .justified
    label.font = UIFont(name: "Copperplate", size: 20)
    label.adjustsFontSizeToFitWidth = true
    label.translatesAutoresizingMaskIntoConstraints = false
    label.backgroundColor = .clear
    
    return label
  }()
  
  var buzzButton : UIButton = {
    var button = UIButton()
    button.backgroundColor = .clear
    button.setImage(UIImage(named: "buzz"), for: .normal)
    button.contentMode = .scaleAspectFill
    button.translatesAutoresizingMaskIntoConstraints = false
    
    return button
  }()
  
  var youtubeButton : UIButton = {
    var button = UIButton()
    button.backgroundColor = .clear
    button.setImage(UIImage(named: "youtube"), for: .normal)
    button.contentMode = .scaleAspectFit
    button.translatesAutoresizingMaskIntoConstraints = false
    
    return button
  }()
  
  var marcianitosButton : UIButton = {
    var button = UIButton()
    button.backgroundColor = .clear
    button.setImage(UIImage(named: "marcianos"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    
    return button
  }()
  
  var wikipediaButton : UIButton = {
    var button = UIButton()
    button.backgroundColor = .clear
    button.setImage(UIImage(named: "wikipedia"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(spaceBackground)
    initInfo()
    initUI()
  }
  
  func initInfo(){
    spaceXInfo = viewModel.detailedInfo
  }
  
  func initUI(){
    
    NSLayoutConstraint.activate([spaceBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0), spaceBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0), spaceBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: 0), spaceBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)])
    
    view.addSubview(detailsLabel)
    NSLayoutConstraint.activate([detailsLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20), detailsLabel.heightAnchor.constraint(equalToConstant: 50), detailsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),detailsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
    
    view.addSubview(elonImage)
    NSLayoutConstraint.activate([elonImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10), elonImage.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 10), elonImage.heightAnchor.constraint(equalToConstant: 50), elonImage.widthAnchor.constraint(equalToConstant: 50)])
    
    let date = spaceXInfo?.launch_date_utc
    if date == nil{
      dateLabel.text = "We don't know the date launch"
    }else{
      let dateLaunch = dateFormatter(date: (spaceXInfo?.launch_date_utc)!)
      dateLabel.text = ("Date: \(dateLaunch)")}
    view.addSubview(dateLabel)
    NSLayoutConstraint.activate([dateLabel.leadingAnchor.constraint(equalTo: elonImage.trailingAnchor, constant: 5),dateLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -65), dateLabel.heightAnchor.constraint(equalToConstant: 50), dateLabel.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 10)])
    
    view.addSubview(alienImage)
    NSLayoutConstraint.activate([alienImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10), alienImage.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5), alienImage.heightAnchor.constraint(equalToConstant: 50), alienImage.widthAnchor.constraint(equalToConstant: 50)])
    
    let site = spaceXInfo?.launch_site?.site_name_long
    if site == nil{
      siteTLabel.text = "We don't know the launch site"
    }else{
      siteTLabel.text = ("Site: \(site!)")}
    view.addSubview(siteTLabel)
    NSLayoutConstraint.activate([siteTLabel.leadingAnchor.constraint(equalTo: alienImage.trailingAnchor, constant: 5),siteTLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -65), siteTLabel.heightAnchor.constraint(equalToConstant: 50), siteTLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5)])
    
    view.addSubview(yodaImage)
    NSLayoutConstraint.activate([yodaImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10), yodaImage.topAnchor.constraint(equalTo: siteTLabel.bottomAnchor, constant: 5), yodaImage.heightAnchor.constraint(equalToConstant: 50), yodaImage.widthAnchor.constraint(equalToConstant: 50)])
    
    let rocketName = spaceXInfo?.rocket?.rocket_name
    if rocketName == nil{
      rocketNameLabel.text = "We don't know rocket's name"
    }else{
      rocketNameLabel.text = ("Rocket: \((rocketName)!)")}
    view.addSubview(rocketNameLabel)
    NSLayoutConstraint.activate([rocketNameLabel.leadingAnchor.constraint(equalTo: yodaImage.trailingAnchor, constant: 5),rocketNameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -65), rocketNameLabel.heightAnchor.constraint(equalToConstant: 50), rocketNameLabel.topAnchor.constraint(equalTo: siteTLabel.bottomAnchor, constant: 5)])
    
    view.addSubview(halImage)
    NSLayoutConstraint.activate([halImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10), halImage.topAnchor.constraint(equalTo: rocketNameLabel.bottomAnchor, constant: 5), halImage.heightAnchor.constraint(equalToConstant: 50), halImage.widthAnchor.constraint(equalToConstant: 50)])
    
    let rocketType = spaceXInfo?.rocket?.rocket_type
    if rocketType == nil{
      rocketTypeLabel.text = "We don't know the type of rocket"
    }else{
      rocketTypeLabel.text = ("Rocket: \((rocketType)!)")}
    view.addSubview(rocketTypeLabel)
    NSLayoutConstraint.activate([rocketTypeLabel.leadingAnchor.constraint(equalTo: halImage.trailingAnchor, constant: 5),rocketTypeLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20), rocketTypeLabel.heightAnchor.constraint(equalToConstant: 50), rocketTypeLabel.topAnchor.constraint(equalTo: rocketNameLabel.bottomAnchor, constant: 5)])
    
    
    collectionViewCarrusel = CollectionViewCarousel(dataSource: (spaceXInfo?.links?.flickr_images)!)
    collectionViewCarrusel!.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(collectionViewCarrusel!)
    let collectionheight = (spaceXInfo?.links?.flickr_images!.isEmpty)! ? 0.0 : 150.0
    NSLayoutConstraint.activate([collectionViewCarrusel!.centerXAnchor.constraint(equalTo: view.centerXAnchor),collectionViewCarrusel!.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20), collectionViewCarrusel!.heightAnchor.constraint(equalToConstant: collectionheight), collectionViewCarrusel!.topAnchor.constraint(equalTo: rocketTypeLabel.bottomAnchor, constant: 15)])
    
    let details = spaceXInfo?.details
    if details == nil {
      launchDetailsLabel.text = "MISSION PASSED!"
      launchDetailsLabel.font = UIFont(name: "Copperplate", size: 35)
      launchDetailsLabel.textAlignment = .center
    }else{
      launchDetailsLabel.text = spaceXInfo?.details
    }
    
    view.addSubview(launchDetailsLabel)
    NSLayoutConstraint.activate([launchDetailsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor), launchDetailsLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20), launchDetailsLabel.topAnchor.constraint(equalTo: collectionViewCarrusel!.bottomAnchor, constant: 5), launchDetailsLabel.heightAnchor.constraint(equalToConstant: 150)])
    
    youtubeButton.addTarget(self, action: #selector(goToYouTube), for: .touchUpInside)
    view.addSubview(youtubeButton)
    NSLayoutConstraint.activate([youtubeButton.widthAnchor.constraint(equalToConstant: 110), youtubeButton.heightAnchor.constraint(equalToConstant: 42), youtubeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10), youtubeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80)])
    
    buzzButton.addTarget(self, action: #selector(goToYouTube), for: .touchUpInside)
    view.addSubview(buzzButton)
    NSLayoutConstraint.activate([buzzButton.widthAnchor.constraint(equalToConstant: 60), buzzButton.heightAnchor.constraint(equalToConstant: 60),buzzButton.leadingAnchor.constraint(equalTo: youtubeButton.trailingAnchor, constant: -10), buzzButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -83)])
    
    marcianitosButton.addTarget(self, action: #selector(goToWebPage), for: .touchUpInside)
    view.addSubview(marcianitosButton)
    NSLayoutConstraint.activate([marcianitosButton.widthAnchor.constraint(equalToConstant: 80), marcianitosButton.heightAnchor.constraint(equalToConstant: 60),marcianitosButton.leadingAnchor.constraint(equalTo: buzzButton.trailingAnchor, constant: 35), marcianitosButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80) ])
    
    wikipediaButton.addTarget(self, action: #selector(goToWebPage), for: .touchUpInside)
    view.addSubview(wikipediaButton)
    NSLayoutConstraint.activate([wikipediaButton.widthAnchor.constraint(equalToConstant: 88),wikipediaButton.heightAnchor.constraint(equalToConstant: 80),wikipediaButton.centerYAnchor.constraint(equalTo: marcianitosButton.centerYAnchor), wikipediaButton.leadingAnchor.constraint(equalTo: marcianitosButton.trailingAnchor, constant: 0)])
  }
  
  @objc func goToYouTube(){
    viewModel.goToYouTube()
  }
  
  @objc func goToWebPage(){
    viewModel.goToWebPage()
  }
  
  
  func dateFormatter(date : String) -> String {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    
    if let date = dateFormatter.date(from: date) {
      
      let newDateFormatter = DateFormatter()
      newDateFormatter.dateFormat = "EEEE, MMM d, yyyy"
      
      let correctDate = newDateFormatter.string(from: date)
      print("Correct Date: \(correctDate)")
      return correctDate
    } else {
      print("Error")
    }
    return ""
  }
  
}
