//
//  OnboardingController.swift
//  OnboardingTest
//
//  Created by Андрей Фроленков on 4.01.24.
//

import UIKit

// MARK: - OnboardingController
final class OnboardingController: UIViewController {

  // MARK: - Private Property
  
  // MARK: - Override Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
  }


}

// MARK: - Setting Views
private extension OnboardingController {
  func setupView() {
    settingSuperview()
    addSubview()
    
    setuplayout()
  }
  
  func settingSuperview() {
    view.backgroundColor = .red
  }
  
  
  
}

// MARK: - Setting
private extension OnboardingController {
  func addSubview() {
    
  }
}

// MARK: - Layout
private extension OnboardingController {
  func setuplayout() {
    
  }
}
