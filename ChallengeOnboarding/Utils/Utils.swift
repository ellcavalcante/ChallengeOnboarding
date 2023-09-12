//
//  Utils.swift
//  ChallengeOnboarding
//
//  Created by Ellington Cavalcante on 11/09/23.
//

import Foundation

class Utils {
    
    enum Key: String {
        case isFirstAccess
    }
    
    static func setFirstAccess(value: Bool) {
        UserDefaults.standard.set(value, forKey: Key.isFirstAccess.rawValue)
    }
    
    static func isFirstAccess() -> Bool {
        UserDefaults.standard.bool(forKey: Key.isFirstAccess.rawValue)
    }
}
