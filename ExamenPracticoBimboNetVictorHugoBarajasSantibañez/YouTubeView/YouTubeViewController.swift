//
//  YouTubeViewController.swift
//  ExamenPracticoBimboNetVictorHugoBarajasSantibañez
//
//  Created by Victor Hugo Barajas Santibañez on 21/01/24.
//

import UIKit
import YouTubePlayer


class YouTubeViewController: UIViewController {
  
  var spaceXInfo : LaunchesPastModel?
  var viewModel : YouTubeViewModel!
  
  var spaceBackground : UIImageView = {
    var image = UIImageView()
    image.image = UIImage(named: "fondo")
    image.contentMode = .scaleAspectFill
    image.translatesAutoresizingMaskIntoConstraints = false
    
    return image
  }()
  
  var launchViewVideo: UIView = {
    var view = UIView()
    view.backgroundColor = .clear
    view.clipsToBounds = true
    view.translatesAutoresizingMaskIntoConstraints = false
    
    return view
  }()
  
  var launchVideo : YouTubePlayerView = {
    var video = YouTubePlayerView()
    
    return video
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(spaceBackground)
    initInfo()
    initUI()
    
  }
  
  func initInfo(){
    spaceXInfo = viewModel.youTubeInfo
  }
  
  
  func initUI(){
    
    view.addSubview(launchViewVideo)
    NSLayoutConstraint.activate([launchViewVideo.centerXAnchor.constraint(equalTo: view.centerXAnchor), launchViewVideo.centerYAnchor.constraint(equalTo: view.centerYAnchor), launchViewVideo.widthAnchor.constraint(equalToConstant: width),launchViewVideo.heightAnchor.constraint(equalToConstant: 400)])
    
    let youTubeID = spaceXInfo?.links?.youtube_id
    
    launchVideo.loadVideoID((youTubeID)!)
    
    launchVideo.frame = CGRect(x: 0, y: 0, width: width, height: 400)
    launchViewVideo.addSubview(launchVideo)
  }
  
}
