//
//  WelcomeScreenController.swift
//  OnboardingTest
//
//  Created by Андрей Фроленков on 5.01.24.
//

import Foundation
import UIKit

private struct Constants {
  struct Gradient {
    static let startPoint = CGPoint(x: 0.0, y: 0.0)
    static let endPoint = CGPoint(x: 0.0, y: 1.0)
  }
}

// MARK: - OnboardingController
final class WelcomeScreenController: UIViewController {
  
  // MARK: - Private Property
  lazy var onboardingButton = createButton(textTitle: "Onboarding")
  
  // MARK: - Override Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
  }
  
  deinit {
    print("deinit")
  }
}

// MARK: - Setting Views
private extension WelcomeScreenController {
  func setupView() {
    settingSuperview()
    addSubview()
    addActions()
    
    setuplayout()
  }
  
  func settingSuperview() {
    view.backgroundColor = .white
    createGradient(view, fromColor: .orange, to: .orange)
  }
  
  // MARK: ConfigureGradient
  func createGradient(_ view: UIView, fromColor: UIColor, to: UIColor ) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = view.bounds
    gradientLayer.colors = [fromColor.cgColor, to.withAlphaComponent(0.5).cgColor]
    gradientLayer.startPoint = Constants.Gradient.startPoint
    gradientLayer.endPoint = Constants.Gradient.endPoint
    view.layer.insertSublayer(gradientLayer, at: 0)
  }
}

// MARK: - Setting
private extension WelcomeScreenController {
  func addSubview() {
    view.addSubview(onboardingButton)
  }
  
  // MARK: - Create UI
  func createButton(textTitle: String) -> UIButton {
    let button = UIButton(configuration: .gray())
    button.setTitleColor(.white, for: .normal)
    button.setTitleColor(.black, for: .highlighted)
    button.setTitle(textTitle, for: .normal)
    return button
  }
  
  // MARK: - Transition
  func transition(to controller: UIViewController) {
    let navigation = UINavigationController(rootViewController: controller)
    navigation.modalPresentationStyle = .fullScreen
    self.present(navigation, animated: true)
  }
  
  // MARK: - Actions
  func addActions() {
    onboardingButton.addTarget(self, action: #selector(onboardingButtonAction), for: .touchUpInside)
  }
  
  // onboardingButton Action
  @objc
  func onboardingButtonAction(_ sender: UIButton) {
    let controller = ModuleBuilder.createOnboardingModule()
    transition(to: controller)
  }
}

// MARK: - Layout
private extension WelcomeScreenController {
  func setuplayout() {
    onboardingButton.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      onboardingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      onboardingButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    ])
  }
}
