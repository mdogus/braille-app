//
//  LearnTabDetailsVC.swift
//  BrailleQuiz
//
//  Created by MUSTAFA DOĞUŞ on 17.02.2020.
//  Copyright © 2020 MUSTAFA DOĞUŞ. All rights reserved.
//

import UIKit
import Firebase

class LearnTabDetailsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var bannerView: GADBannerView!
    
    var chosenRow = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Table view
        tableView.delegate = self
        tableView.dataSource = self
        //Navigation item title
        if chosenRow == 0 {
            self.navigationItem.title = "Louis Braille"
        } else if chosenRow == 1 {
            self.navigationItem.title = "Altı Nokta"
        } else if chosenRow == 2 {
            self.navigationItem.title = "Harfler"
        } else if chosenRow == 3 {
            self.navigationItem.title = "Sayılar"
        } else if chosenRow == 4 {
            self.navigationItem.title = "Noktalama İşaretleri"
        } else if chosenRow == 5 {
            self.navigationItem.title = "Bir harfli Kısaltmalar"
        }
        
        
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
        var arrayCount = 0
        if chosenRow == 0 {
            
        } else if chosenRow == 1 {
            
        } else if chosenRow == 2 {
            arrayCount = letters.count
        } else if chosenRow == 3 {
            arrayCount = numbers.count
        } else if chosenRow == 4 {
            arrayCount = punctuationMarks.count
        } else if chosenRow == 5 {
            arrayCount = singleLetterContracts.count
        }
        return arrayCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "learnCell", for: indexPath) as! LearnCell
        
        if chosenRow == 0 {
            
        } else if chosenRow == 1 {
            
        } else if chosenRow == 2 {
            cell.printLabel.text = letters[indexPath.row]
            cell.brailleLabel.text = letters[indexPath.row]
        } else if chosenRow == 3 {
            cell.printLabel.text = numbers[indexPath.row]
            cell.brailleLabel.text = "K\(numbers[indexPath.row])"
        } else if chosenRow == 4 {
            cell.printLabel.text = punctuationMarks[indexPath.row]
            cell.brailleLabel.text = punctuationLabel[indexPath.row]
        } else if chosenRow == 5 {
            cell.printLabel.text = singleLetterContracts[indexPath.row].learnTab
            cell.brailleLabel.text = singleLetterContracts[indexPath.row].sign
        }
            
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .white
        } else {
            cell.backgroundColor = .quaternaryLabel
        }
            
        
        return cell
    }
    


}
