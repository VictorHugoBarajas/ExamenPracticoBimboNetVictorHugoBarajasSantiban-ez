//
//  WebPageViewController.swift
//  ExamenPracticoBimboNetVictorHugoBarajasSantibañez
//
//  Created by Victor Hugo Barajas Santibañez on 21/01/24.
//

import UIKit
import WebKit


class WebPageViewController: UIViewController{
  
  var viewModel : WebPageViewModel!
  var spaceXInfo: LaunchesPastModel?
  
  var webView : WKWebView = {
    let webView = WKWebView()
    webView.translatesAutoresizingMaskIntoConstraints = false
    
    return webView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initInfo()
    initUI()
  }
  
  func initInfo(){
    spaceXInfo = viewModel.webPageInfo
  }
  
  func initUI(){
    
    let webLink = spaceXInfo?.links?.wikipedia
    let url = URL(string: webLink!)
    let request = URLRequest(url: url!)
    webView.load(request)
    
    view.addSubview(webView)
    NSLayoutConstraint.activate([webView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0), webView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0), webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0), webView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)])
  }
  
}
