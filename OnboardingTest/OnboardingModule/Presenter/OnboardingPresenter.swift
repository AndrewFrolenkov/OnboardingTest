//
//  OnboardingPresenter.swift
//  OnboardingTest
//
//  Created by Андрей Фроленков on 5.01.24.
//

import Foundation

protocol OnboardingProtocol: AnyObject {
  
  func updateButtonTitle(title: String)
  
  func dismissController()
}

protocol OnboardingPresenterProtocol {
  init(view: OnboardingProtocol, database: MokDataBaseProtocol)
  var sushiArray: [SushiModel]? { get set }
  var currentPage: Int { get set }
  func getData() -> [SushiModel]
  func updateCurrentPage() -> IndexPath
  
}

class OnboardingPresenter: OnboardingPresenterProtocol {
  
  weak var view: OnboardingProtocol?
  let dataBase: MokDataBaseProtocol!
  var sushiArray: [SushiModel]?
  
  var currentPage = 0 {
    didSet {
      guard let sushiArray = sushiArray else { return }
      if currentPage == sushiArray.count - 1 {
        view?.updateButtonTitle(title: "Close")
      } else {
        view?.updateButtonTitle(title: "Next")
      }
    }
  }
  
  required init(view: OnboardingProtocol, database: MokDataBaseProtocol) {
    self.view = view
    self.dataBase = database
  }
  
  func getData() -> [SushiModel] {
    sushiArray = dataBase.fetchData()
    guard let sushiArray = sushiArray  else { return []}
    return sushiArray
  }
  
  func updateCurrentPage() -> IndexPath {
    guard let sushiArray = sushiArray else { return IndexPath(item: 0, section: 0) }
    if currentPage == sushiArray.count - 1 {
      view?.dismissController()
      
    } else {
      currentPage += 1
      let indexPath = IndexPath(row: currentPage, section: 0)
      return indexPath
    }
    return IndexPath(row: currentPage, section: 0)
  }
}
