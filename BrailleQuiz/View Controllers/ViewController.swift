//
//  ViewController.swift
//  BrailleQuiz
//
//  Created by MUSTAFA DOĞUŞ on 25.09.2019.
//  Copyright © 2019 MUSTAFA DOĞUŞ. All rights reserved.
//

import UIKit
import GameplayKit
import Firebase

class ViewController: UIViewController {
    
    var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBoard()
        //Banner
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        addBannerViewToView(bannerView)
        
        
        //Labels
        headlineLabel.text = "Alıştırma Yap"
        switchLabel.text = "Karıştır"
        //Braille label background
        brailleBacgroundView.layer.borderWidth = 5
        brailleBacgroundView.layer.cornerRadius = 20
        brailleBacgroundView.layer.borderColor = UIColor.black.cgColor
        
        segmentedOptions.removeAllSegments()
        let segments = ["Harfler", "Sayılar", "Kısaltmalar"]
        for segment in segments {
            segmentedOptions.insertSegment(withTitle: segment, at: segments.count, animated: false)
        }
        segmentedOptions.selectedSegmentIndex = 0
        
        segmentOptionsContracted.removeAllSegments()
        let segments2 = ["1 Harfli", "2 Harfli", "Hece", "Kök", "Parça"]
        for segment in segments2 {
            segmentOptionsContracted.insertSegment(withTitle: segment, at: segments2.count, animated: false)
            //segmentOptionsContracted.isHidden = true
        }
        segmentOptionsContracted.selectedSegmentIndex = 0
    }
    

    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var segmentedOptions: UISegmentedControl!
    @IBOutlet weak var segmentOptionsContracted: UISegmentedControl!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var brailleBacgroundView: UIView!
    @IBOutlet weak var brailleLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBAction func segmentedOptionControl(_ sender: Any) {
        updateBoard()
    }
    @IBAction func segmentedOptionContractedControl(_ sender: Any) {
        updateBoard()
    }
    @IBAction func showAnswer(_ sender: Any) {
        let selectedSegmentIndex = segmentedOptions.selectedSegmentIndex
        
        if selectedSegmentIndex == 0 { // Harfler
            answerLabel.text = brailleLabel.text
        } else if selectedSegmentIndex == 1 { // Sayılar
            let label = brailleLabel.text!
            answerLabel.text = String(label.dropFirst())
        } else if selectedSegmentIndex == 2 { // Kısaltmalar
            let selectedSegmentIndex = segmentOptionsContracted.selectedSegmentIndex
            if selectedSegmentIndex == 0 { // 1 harfli
                answerLabel.text = singleLetterContractLabel.word
            } else if selectedSegmentIndex == 1 { // 2 Harfli
                answerLabel.text = doubleLetterContractLabel.word
            } else if selectedSegmentIndex == 2 { // Hece
                answerLabel.text = "Eklenecek: Hece"
            } else if selectedSegmentIndex == 3 { // Kök
                answerLabel.text = "Eklenecek: Kök"
            } else { // Parça
                answerLabel.text = "Eklenecek: Parça"
            }
            
        } else {
            answerLabel.text = "Hata 1"
        }
    }
    
    @IBAction func goToNextLetter(_ sender: Any) {
        updateBoard()
    }
    
    @IBAction func switchTapped(_ sender: Any) {
    }
    
    var singleLetterContractLabel: SingleLetterContract = .a
    func getRandomSingleLetterContract(_ single: SingleLetterContract) {
        singleLetterContractLabel = getRandomCaseForSingle(singleLetterContracts)
    }
    
    var doubleLetterContractLabel: DoubleLetterContract = .bd
    func getRandomDoubleLetterContract(_ double: DoubleLetterContract) {
        doubleLetterContractLabel = getRandomCaseForDouble(doubleLetterContracts)
    }
    
    func updateBoard() {
        answerLabel.text = "?"
        
        var indexOfSelectedSegment = segmentedOptions.selectedSegmentIndex
        var indexOfSelectedSegContracted = segmentOptionsContracted.selectedSegmentIndex
        
        getRandomSingleLetterContract(singleLetterContractLabel)
        getRandomDoubleLetterContract(doubleLetterContractLabel)
        
        if indexOfSelectedSegment == 0 { // Harfler
            let index = getRandomIndex(letters)
            brailleLabel.text = letters[index]
            statusLabel.text = "Harfler görüntülenmektedir."
            segmentOptionsContracted.isHidden = true
            indexOfSelectedSegment = 0
        } else if indexOfSelectedSegment == 1 {
            let index = getRandomIndex(numbers)
            brailleLabel.text = "K" + numbers[index]
            statusLabel.text = "1-50 arası sayılar görüntülenmektedir."
            segmentOptionsContracted.isHidden = true
            indexOfSelectedSegment = 1
        } else if indexOfSelectedSegment == 2 {
            indexOfSelectedSegment = 2
            //indexOfSelectedSegContracted = 0
            
            if indexOfSelectedSegContracted == 0 { // 1 Harfli
                brailleLabel.text = singleLetterContractLabel.sign
                statusLabel.text = "Bir harfli kısaltmalar görüntülenmektedir."
                segmentOptionsContracted.isHidden = false
                indexOfSelectedSegContracted = 0
            } else if indexOfSelectedSegContracted == 1 { // 2 Harfli
                brailleLabel.text = doubleLetterContractLabel.sign
                statusLabel.text = "İki harfli kısaltmalar görüntülenmektedir."
                segmentOptionsContracted.isHidden = false
                indexOfSelectedSegContracted = 1
            } else if indexOfSelectedSegContracted == 2 { //
                //brailleLabel.text = singleLetterContractLabel.sign
                statusLabel.text = "hece kısaltmaları görüntülenmektedir."
                segmentOptionsContracted.isHidden = false
                indexOfSelectedSegContracted = 2
            } else if indexOfSelectedSegContracted == 3 {
                //brailleLabel.text = singleLetterContractLabel.sign
                statusLabel.text = "Kelime kökü kısaltmaları görüntülenmektedir."
                segmentOptionsContracted.isHidden = false
                indexOfSelectedSegContracted = 3
            } else {
                //brailleLabel.text = singleLetterContractLabel.sign
                statusLabel.text = "Kelime parçası kısaltmaları görüntülenmektedir."
                
                segmentOptionsContracted.isHidden = false
                indexOfSelectedSegContracted = 4
            }
        } else {
            answerLabel.text = "Hata 2"
        }
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
}

