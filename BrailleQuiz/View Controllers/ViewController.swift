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
    
    // Karıştır düğmesi açıkken kullanılacak indexler:
    var indexForLetters = 0
    var indexForNumbers = 0
    var indexForSingleLC = 0
    var indexForDoubleLC = 0
    
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
        brailleBacgroundView.backgroundColor = UIColor(red: 255/255, green: 160/255, blue: 122/255, alpha: 1)
        brailleBacgroundView.layer.borderWidth = 5
        brailleBacgroundView.layer.borderColor = UIColor.white.cgColor
        brailleBacgroundView.layer.cornerRadius = 20
        brailleBacgroundView.layer.shadowPath = UIBezierPath(rect: brailleBacgroundView.bounds).cgPath
        brailleBacgroundView.layer.shadowColor = UIColor.black.cgColor
        brailleBacgroundView.layer.shadowOpacity = 0.4
        brailleBacgroundView.layer.shadowRadius = 20
        brailleBacgroundView.layer.shadowOffset = CGSize(width: 1, height: 3)
        //Segmented options
        segmentedOptions.backgroundColor = UIColor(red: 255/255, green: 160/255, blue: 122/255, alpha: 1)
        segmentedOptions.removeAllSegments()
        let segments = ["Harfler", "Sayılar", "Kısaltmalar"]
        for segment in segments {
            segmentedOptions.insertSegment(withTitle: segment, at: segments.count, animated: false)
        }
        segmentedOptions.selectedSegmentIndex = 0
        
        segmentOptionsContracted.backgroundColor = UIColor(red: 255/255, green: 160/255, blue: 122/255, alpha: 1)
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
    @IBOutlet weak var shuffleSwitch: UISwitch!
    
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
        if shuffleSwitch.isOn == false {
            let selectedSegmentIndex = segmentedOptions.selectedSegmentIndex
            
            if selectedSegmentIndex == 0 {
                if indexForLetters < (letters.count - 1) {
                    indexForLetters += 1
                    updateBoard()
                } else {
                    indexForLetters = 0
                }
            } else if selectedSegmentIndex == 1 {
                if indexForNumbers < (numbers.count - 1) {
                    indexForNumbers += 1
                    updateBoard()
                } else {
                    indexForNumbers = 0
                }
            } else if selectedSegmentIndex == 2 {
                let selectedSegmentIndex = segmentOptionsContracted.selectedSegmentIndex
                
                if selectedSegmentIndex == 0 {
                    if indexForSingleLC < (singleLetterContracts.count - 1) {
                        indexForSingleLC += 1
                        updateBoard()
                    } else {
                        indexForSingleLC = 0
                    }
                } else if selectedSegmentIndex == 1 {
                    // iki harfli kısaltmalar için counter ekle
                    // iki harfli kısaltmalar için array ekle
                }
            }
        } else {
            updateBoard()
        }
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
        
        if shuffleSwitch.isOn == true {
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
        } else {
            if indexOfSelectedSegment == 0 { // Harfler
                let index = indexForLetters
                brailleLabel.text = letters[index]
                statusLabel.text = "Harfler gösterilmektedir."
                segmentOptionsContracted.isHidden = true
                indexOfSelectedSegment = 0
            } else if indexOfSelectedSegment == 1 {
                let index = indexForNumbers
                brailleLabel.text = "K" + numbers[index]
                statusLabel.text = "1-50 arası sayılar gösterilmektedir."
                segmentOptionsContracted.isHidden = true
                indexOfSelectedSegment = 1
            } else if indexOfSelectedSegment == 2 {
                indexOfSelectedSegment = 2
                
                if indexOfSelectedSegContracted == 0 { // 1 Harfli
                    let index = indexForSingleLC
                    brailleLabel.text = singleLetterContracts[index].sign
                    statusLabel.text = "Bir harfli kısaltmalar gösterilmektedir."
                    segmentOptionsContracted.isHidden = false
                    indexOfSelectedSegContracted = 0
                } else if indexOfSelectedSegContracted == 1 { // 2 Harfli
                    brailleLabel.text = doubleLetterContractLabel.sign
                    statusLabel.text = "İki harfli kısaltmalar gösterilmektedir."
                    segmentOptionsContracted.isHidden = false
                    indexOfSelectedSegContracted = 1
                } else if indexOfSelectedSegContracted == 2 { //
                    //brailleLabel.text = singleLetterContractLabel.sign
                    statusLabel.text = "Hece kısaltmaları gösterilmektedir."
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

