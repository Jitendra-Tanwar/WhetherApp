//
//  WheatherDetailsVC.swift
//  WhetherApp
//
//  Created by jitendra on 30/04/22.
//

import UIKit

class WheatherDetailsVC: UIViewController {

    @IBOutlet weak var btnMyLocation: UIButton!
    @IBOutlet weak var lblMinTemp: UILabel!
    @IBOutlet weak var lblGroundLevel: UILabel!
    @IBOutlet weak var lblSeaLevel: UILabel!
    @IBOutlet weak var lblPressure: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    @IBOutlet weak var lblAvgTemp: UILabel!
    @IBOutlet weak var lblMaxTemp: UILabel!
    
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblVisibility: UILabel!
    @IBOutlet weak var lblSpeed: UILabel!
    @IBOutlet weak var lblGust: UILabel!
    @IBOutlet weak var lblDeg: UILabel!
    
    
    var wheatherObj = WhetherDetailModal()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
        btnMyLocation.layer.cornerRadius = 10
        btnMyLocation.clipsToBounds = true
    }
    
    func loadData() {
        
        lblDescription.text = "\(wheatherObj.weatherDesc)"

        lblMinTemp.text = "\(wheatherObj.tempMin)"
        lblMaxTemp.text = "\(wheatherObj.tempMax)"

        lblSeaLevel.text = "\(wheatherObj.seaLevel)"
        lblPressure.text = "\(wheatherObj.pressure)"
        lblHumidity.text = "\(wheatherObj.humidity)"
        lblAvgTemp.text = "\(wheatherObj.temp)"
        lblGroundLevel.text = "\(wheatherObj.groundLevel)"
        
        lblVisibility.text = "\(wheatherObj.visibility)"
        lblSpeed.text = "\(wheatherObj.windSpeed)"
        lblGust.text = "\(wheatherObj.windGust)"
        lblDeg.text = "\(wheatherObj.windDeg)"

    }
    
    @IBAction func showMyLocation(_ sender: Any) {
        let storyBoardObj = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoardObj.instantiateViewController(withIdentifier: "MyLocationVC") as! MyLocationVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
