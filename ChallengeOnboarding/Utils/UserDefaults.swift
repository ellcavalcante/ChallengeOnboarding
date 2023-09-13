//
//  Utils.swift
//  ChallengeOnboarding
//
//  Created by Ellington Cavalcante on 11/09/23.
//

import Foundation

extension UserDefaults {
    private enum UserDefaultsKeys: String {
        case notTheFirstAccess
    }
    
    var notTheFirstAccess: Bool {
        get {
            bool(forKey: UserDefaultsKeys.notTheFirstAccess.rawValue)
        }
        
        set {
            setValue(newValue, forKey: UserDefaultsKeys.notTheFirstAccess.rawValue)
        }
    }
}
