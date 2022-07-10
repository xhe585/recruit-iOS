//
//  SwinjectStoryboardExtension.swift
//  ASBInterviewExercise
//
//  Created by Jackie He on 11/07/22.
//

import Foundation
import SwinjectStoryboard

extension SwinjectStoryboard {
    @objc class func setup() {
        defaultContainer.storyboardInitCompleted(MainViewController.self) { r, c in
            c.apiService = DIManager.shared.resolve(TransactionApiService.self)
        }
        
        defaultContainer.storyboardInitCompleted(TransactionDetailViewController.self) { r, c in
        }
    }
}
