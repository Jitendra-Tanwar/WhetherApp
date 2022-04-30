//
//  HomeVC.swift
//  WhetherApp
//
//  Created by jitendra on 30/04/22.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var tblList: UITableView!
    var arrWhethers = [WhetherDetailModal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Wheather List"
        ApiCalls.shared.getWeatherData { arrWheather in
            self.arrWhethers = arrWheather
            DispatchQueue.main.async {
                self.tblList.reloadData()
            }
           // print(arrWheather)
        }
    }
    

    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrWhethers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellWheather") as! CellWheather
        cell.lblDate.text = arrWhethers[indexPath.row].dtText
        cell.lblTemp.text = "\(arrWhethers[indexPath.row].tempMin) - \(arrWhethers[indexPath.row].tempMax)"
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoardObj = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoardObj.instantiateViewController(withIdentifier: "WheatherDetailsVC") as! WheatherDetailsVC
        vc.wheatherObj = self.arrWhethers[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

class CellWheather: UITableViewCell {
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
}
