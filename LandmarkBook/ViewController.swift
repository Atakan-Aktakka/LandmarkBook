//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Atakan Aktakka on 2.09.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        landmarkNames.append("Face")
        landmarkNames.append("Freedom")
        landmarkNames.append("GreatWall")
        landmarkNames.append("Kolezyum")
        landmarkNames.append("Mayans")
        landmarkNames.append("Mountain")
        landmarkNames.append("Palace")
        landmarkNames.append("Stone")
        landmarkNames.append("Tower")
        landmarkNames.append("Wall")
        
        
        landmarkImages.append(UIImage(named: "face.jpg")!)
        landmarkImages.append(UIImage(named: "freedom.jpeg")!)
        landmarkImages.append(UIImage(named: "greatWall.jpg")!)
        landmarkImages.append(UIImage(named: "kolezyum.jpg")!)
        landmarkImages.append(UIImage(named: "mayans.jpeg")!)
        landmarkImages.append(UIImage(named: "mountain.jpg")!)
        landmarkImages.append(UIImage(named: "palace.jpeg")!)
        landmarkImages.append(UIImage(named: "stone.png")!)
        landmarkImages.append(UIImage(named: "Tower.jpg")!)
        landmarkImages.append(UIImage(named: "wall.jpeg")!)
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        //content.secondaryText = "Test"
        //content.image = landmarkImages[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .middle)
        }
    }

}

