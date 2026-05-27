//
//  DetailViewController.swift
//  Horoscope-IOS
//
//  Created by Tardes on 22/5/26.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameDetailLabel: UILabel!
    
    @IBOutlet weak var dateDetailLabel: UILabel!
    
    @IBOutlet weak var imageDetailLabel: UIImageView!
    
    @IBOutlet weak var favoriteMenuItem: UIBarButtonItem!
    
    @IBOutlet weak var predictionTextView: UITextView!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    
    let session = SessionManager()
    
    var isFavorite = false
    
    var prediction: String?
    
    var horoscope: Horoscope!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = horoscope.name
        
        renderDetail(horoscope: horoscope)
        
        isFavorite = session.isFavoriteHoroscope(id: horoscope.id)
        setFavoriteIcon()
        getPrediction(period: "daily")
    }
    
    func setFavoriteIcon(){
        if (isFavorite){
            favoriteMenuItem.image = UIImage(systemName: "heart.fill")
        }else {
            favoriteMenuItem.image = UIImage(systemName: "heart")
        }
    }
    
    @IBAction func favoriteMenuClicked(_ sender: Any) {
        isFavorite = !isFavorite
        if (isFavorite){
            session.setFavoriteHoroscope(id: horoscope.id)
        }else {
            session.setFavoriteHoroscope(id: "")
        }
        setFavoriteIcon( )
    }
    @IBAction func shareMenuClicked(_ sender: Any) {
        if let prediction = prediction{
            let textToShare = [ prediction ]
            let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            
            self.present(activityViewController, animated: true, completion: nil)
        }
        
        
    }
    
    func renderDetail(horoscope: Horoscope){
        nameDetailLabel.text = horoscope.name
        dateDetailLabel.text = horoscope.dates
        imageDetailLabel.image = horoscope.getImage()
    }
    
    @IBAction func periodChange(_ sender: UISegmentedControl) {
        let period = switch sender.selectedSegmentIndex {
        case 0://daily
            "daily"
        case 1://weekely
            "weekly"
        default://monthly
            "monthly"
        }
        getPrediction(period: period)
        
    }
    
    func getPrediction(period: String){
        self.predictionTextView.text = "Consultando con las estrellas..."
        self.loadingView.isHidden = false
        //crea una especie de corutina para llamar a la funcion
        Task {
            self.prediction = await HoroscopeApi.getPrediction(forSign: horoscope.id, withPeriod: period)
            DispatchQueue.main.async {
                self.predictionTextView.text = self.prediction
                self.loadingView.isHidden = true
            }
        }
    }
}
