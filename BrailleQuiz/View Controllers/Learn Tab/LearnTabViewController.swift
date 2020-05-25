//
//  LearnTabViewController.swift
//  BrailleQuiz
//
//  Created by MUSTAFA DOĞUŞ on 14.01.2020.
//  Copyright © 2020 MUSTAFA DOĞUŞ. All rights reserved.
//

import UIKit
import Firebase

class LearnTabViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var bannerView: GADBannerView!
    
    var tabs = ["Louis Braille",
                "Altı Nokta",
                "Harfler",
                "Sayılar",
                "Noktalama İşaretleri",
                "Bir Harfli Kısaltmalar",
                "İki Harfli Kısaltmalar",
                "Hece Kısaltmaları",
                "Kelime Kökü Kısaltmaları",
                "Kelime Parçası Kısaltmaları"]
    
    var selectedRow = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Table View
        tableView.delegate = self
        tableView.dataSource = self

        //Banner
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        bannerView.accessibilityElementsHidden = true
        
        addBannerViewToView(bannerView)
        
        
    }
    

    //AdMob function
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: bottomLayoutGuide,
                           attribute: .top,
                           multiplier: 1,
                           constant: 0),
        NSLayoutConstraint(item: bannerView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0)
       ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tabs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = tabs[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        if selectedRow == 0 {
            
        } else if selectedRow == 1 {
            
        } else if selectedRow == 2 {
            performSegue(withIdentifier: "toLearnDetailsVC", sender: nil)
        } else if selectedRow == 3 {
            performSegue(withIdentifier: "toLearnDetailsVC", sender: nil)
        } else if selectedRow == 4 {
            performSegue(withIdentifier: "toLearnDetailsVC", sender: nil)
        } else if selectedRow == 5 {
            performSegue(withIdentifier: "toLearnDetailsVC", sender: nil)
        }
            
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toLearnDetailsVC" {
            let destination = segue.destination as! LearnTabDetailsVC
            destination.chosenRow = selectedRow
        }
    }
    
}
