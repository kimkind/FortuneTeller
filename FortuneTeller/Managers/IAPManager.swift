//
//  IAPManager.swift
//  FortuneTeller
//
//  Created by Kimkind Yeung on 19/7/2025.
//

import Foundation
import StoreKit

class IAPManager: NSObject, ObservableObject {
    static let shared = IAPManager()
    
    private override init() {
        super.init()
    }
    
    func purchaseProduct(with id: String) {
        // Mock IAP
        print("Mock purchase for \(id)")
    }
}
