//
//  SolidMaterialTableViewController.swift
//  metalWeightCalculator
//
//  Created by Gökhan Kıdak on 2.10.2023.
//

import UIKit

class SolidMaterialTableViewController : UITableViewController
{
    var solidCalculators : [SolidCalculator] = [Plate(),Hexagonal(),RectangularBar(),RectangularTube(),Bar(),RoundPipe()]
    var selectedIndex = 0

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return solidCalculators.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "solidMatCell",for: indexPath)
        cell.textLabel?.text = solidCalculators[indexPath.row].name
        cell.imageView?.image = UIImage(resource: solidCalculators[indexPath.row].imageResource)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ShowCalculator")
        {
            let destinationVC = segue.destination as! CalculatorViewController
            destinationVC.solidCalc = solidCalculators[selectedIndex]
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "ShowCalculator", sender: nil)
    }
}
