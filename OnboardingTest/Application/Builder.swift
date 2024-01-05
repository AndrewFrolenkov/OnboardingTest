//
//  Builder.swift
//  OnboardingTest
//
//  Created by Андрей Фроленков on 5.01.24.
//

import UIKit

protocol Builder {
  static func createOnboardingModule() -> UIViewController
}

class ModuleBuilder: Builder {
  
 static func createOnboardingModule() -> UIViewController {
   let view = OnboardingController()
   let dataBase = MokDataBase()
   let presenter = OnboardingPresenter(view: view, database: dataBase)
   view.presenter = presenter
   return view
  }
}
