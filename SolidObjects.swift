//
//  SolidObjects.swift
//  metalWeightCalculator
//
//  Created by Gökhan Kıdak on 2.10.2023.
//

class Plate : SolidCalculator
{
    var name = "Plate"
    var imageResource = ImageResource.rectangularPlate
    
    var parameterCount = 3
    var parameterNames =  ["t","L","W"]
    
    func CalculateVolume(a: Float, b: Float, c: Float, d: Float)throws -> Float {
        
        if(a*b*c == 0){
            throw VolumeCalculationError.invalidValue
        }
        
        return a*b*c
    }
}

class Hexagonal : SolidCalculator
{
    var name = "Hexagonal"
    var imageResource = ImageResource.hexagonalBar
    
    var parameterCount = 2
    var parameterNames = ["a","L"]
    
    func CalculateVolume(a: Float, b: Float, c: Float, d: Float)throws -> Float {
        
        if(a*b == 0){
            throw VolumeCalculationError.invalidValue
        }
        
        let const : Float = 2.6
        return a*a*b*const
    }
}

class RectangularBar : SolidCalculator
{
    var name = "Rectangular Bar"
    var imageResource = ImageResource.rectangularBar
    
    var parameterCount = 3
    var parameterNames = ["d","W","L"]
    
    func CalculateVolume(a: Float, b: Float, c: Float, d: Float)throws -> Float {
        
        if(a*b*c == 0){
            throw VolumeCalculationError.invalidValue
        }
        
        return a*b*c
    }
}

class RectangularTube : SolidCalculator
{
    var name = "Rectangular Tube"
    var imageResource = ImageResource.rectangularTube
    
    var parameterCount = 4
    var parameterNames = ["d","W","L","t"]
    
    func CalculateVolume(a: Float, b: Float, c: Float, d: Float)throws -> Float {
        
        if(a*b*c*d == 0){
            throw VolumeCalculationError.invalidValue
        }
        
        let outsideArea = a*b
        let insideArea = (a-d) * (b-d)
        let actualArea = outsideArea - insideArea
        return actualArea * c
    }
}

class Bar : SolidCalculator
{
    var name = "Round Bar"
    var imageResource = ImageResource.roundBar
    
    var parameterCount = 2
    var parameterNames = ["D","L"]
    let pi : Float = 3.14159
    
    func CalculateVolume(a: Float, b: Float, c: Float, d: Float)throws -> Float {
        
        if(a*b == 0){
            throw VolumeCalculationError.invalidValue
        }
        
        return (a/2)*(a/2)*pi*b
    }
}

class RoundPipe : SolidCalculator
{
    var name = "Round Pipe"
    var imageResource = ImageResource.roundPipe
    
    var parameterCount = 3
    var parameterNames = ["Do","Di","L"]
    let pi : Float = 3.14159
    
    func CalculateVolume(a: Float, b: Float, c: Float, d: Float)throws -> Float {
        
        if(a*b*c == 0){
            throw VolumeCalculationError.invalidValue
        }
        
        return ((a/2)*(a/2)-(b/2)*(b/2))*pi*c
    }
}

enum VolumeCalculationError: Error {
  case invalidValue
}


