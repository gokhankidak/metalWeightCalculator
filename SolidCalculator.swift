//
//  SolidCalculator.swift
//  metalWeightCalculator
//
//  Created by Gökhan Kıdak on 2.10.2023.
//

import UIKit

protocol SolidCalculator{
    var parameterCount : Int { get }
    var parameterNames : [String] { get }
    var name : String { get }
    var imageResource : ImageResource { get }
    func CalculateVolume(a : Float,b : Float , c : Float,d : Float) throws -> Float
}
