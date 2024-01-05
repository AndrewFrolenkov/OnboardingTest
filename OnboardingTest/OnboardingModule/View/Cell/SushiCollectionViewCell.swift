//
//  SushiCollectionViewCell.swift
//  OnboardingTest
//
//  Created by Андрей Фроленков on 5.01.24.
//

import Foundation
import UIKit

// MARK: - SushiCollectionViewCell
final class SushiCollectionViewCell: UICollectionViewCell {
  
  private lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private lazy var descriptionLabel = {
    let descriptionSushiLabel = UILabel()
    descriptionSushiLabel.numberOfLines = 0
    descriptionSushiLabel.font = UIFont.systemFont(ofSize: 30)
    descriptionSushiLabel.textAlignment = .center
    descriptionSushiLabel.translatesAutoresizingMaskIntoConstraints = false
    return descriptionSushiLabel
  }()
  
  private lazy var smallDescriptionLabel = {
    let smallDescriptionLabel = UILabel()
    smallDescriptionLabel.textAlignment = .center
    smallDescriptionLabel.textColor = .lightGray
    smallDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    return smallDescriptionLabel
  }()
  
  // MARK: - Override
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubviews()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Public Methods
  func configureCell(model: SushiModel) {
    imageView.image = UIImage(named: model.mainImage)
    descriptionLabel.text = model.description
    smallDescriptionLabel.text = model.smallDescription
  }
  
  // MARK: - Private Methods
  private func addSubviews() {
    addSubview(imageView)
    addSubview(descriptionLabel)
    addSubview(smallDescriptionLabel)
  }
  
  // MARK: - layout
  private func layout() {
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: topAnchor),
      imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: trailingAnchor),

      imageView.heightAnchor.constraint(equalToConstant: frame.height / 2),
      
      descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
      descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      
      smallDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      smallDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      smallDescriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
    ])
  }
}
