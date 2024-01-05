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
  var presenter: OnboardingPresenterProtocol!
  private lazy var collectionView = settingCollectionView()
  private lazy var nextButton: UIButton = {
    let button = UIButton(configuration: .gray())
    button.setTitleColor(.white, for: .normal)
    button.setTitleColor(.black, for: .highlighted)
    button.setTitle("Next", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
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
    addActions()
    
    setuplayout()
  }
  
  func settingSuperview() {
    view.backgroundColor = #colorLiteral(red: 0.9263755679, green: 0.9263755679, blue: 0.9263755679, alpha: 1)
  }
}

// MARK: - Setting
private extension OnboardingController {
  func addSubview() {
    view.addSubview(collectionView)
    view.addSubview(nextButton)
  }
  
  func settingCollectionView() -> UICollectionView {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.layer.cornerRadius = 20
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.isPagingEnabled = true
    collectionView.register(SushiCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.delegate = self
    collectionView.dataSource = self
    return collectionView
  }
  
  // MARK: - Actions
  func addActions() {
    nextButton.addTarget(self, action: #selector(nextPageAction), for: .touchUpInside)
  }
  
  // nextButton Action
  @objc
  func nextPageAction(_ sender: UIButton) {
   let index = presenter.updateCurrentPage()
   collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
    
  }
  
}

// MARK: - Layout
private extension OnboardingController {
  func setuplayout() {
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
      collectionView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200),
      
      nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
      
    ])
  }
}

// MARK: - UICollectionViewDataSource
extension OnboardingController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? SushiCollectionViewCell else { return UICollectionViewCell()}
    let data = presenter.getData()
    cell.configureCell(model: data[indexPath.row])
    return cell
  }
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    let width = scrollView.frame.width
    presenter.currentPage = Int(scrollView.contentOffset.x / width)
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension OnboardingController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    0
  }
}

extension OnboardingController: OnboardingProtocol {

  func updateButtonTitle(title: String) {
    nextButton.setTitle(title, for: .normal)
  }
  
  func dismissController() {
    dismiss(animated: true)
  }
  
}
