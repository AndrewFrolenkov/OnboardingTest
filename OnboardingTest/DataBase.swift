//
//  DataBase.swift
//  OnboardingTest
//
//  Created by Андрей Фроленков on 5.01.24.
//

import Foundation
import UIKit

class DataBase {
  
  static func fetchSushi() -> [SushiModel] {
    let firstItem = SushiModel(mainImage: UIImage(named: "image1"),
                               description: "Ordina a domicilio senza limiti di distanza. Non è magia, è Moovenda!",
                               smallDescription: "PRONTO?")
    
    let secondItem = SushiModel(mainImage: UIImage(named: "image2"),
                               description: "Ogni tanto inviamo degli sconti esclusivi tramite notifiche push, ci stai?",
                               smallDescription: "PROMOZIONI")
    
    let thirdItem = SushiModel(mainImage: UIImage(named: "image3"),
                               description: "Per sfruttare al massimo l'app, puoi condividerci la tua posizione?",
                               smallDescription: "POSIZIONE")
    
    
    return [firstItem, secondItem, thirdItem]
  }
}
