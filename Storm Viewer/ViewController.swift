//
//  ViewController.swift
//  Storm Viewer
//
//  Created by Anouar El maaroufi on 2/26/24.
//  Copyright © 2024 Anouar El maaroufi. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tbc = tableView.dequeueReusableCell(withIdentifier: "Picture")
        
        tbc?.textLabel?.text = pictures[indexPath.row]

        return tbc!
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.imageName = pictures[indexPath.row]
            vc.pictureNumber = indexPath.row + 1
            vc.totalPictures = pictures.count

            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
