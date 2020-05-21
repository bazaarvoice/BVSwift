//
//  ViewModelControllerDelegate.swift
//  BVSwiftDemo
//
//  Created by Balkrishna Singbal on 20/05/20.
//  Copyright © 2020 Bazaarvoice. All rights reserved.
//

import Foundation

protocol ViewModelControllerDelegate {
    
    associatedtype ViewControllerDelegate
    
    var viewController: ViewControllerDelegate { get set }
}

typealias BVSwiftViewModelType = ViewModelCoodinated & ViewModelControllerDelegate