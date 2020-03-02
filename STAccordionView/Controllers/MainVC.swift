//
//  MainVC.swift
//  STAccordionView
//
//  Created by Saim on 02/03/2020.
//  Copyright © 2020 Saim. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var tblMain: UITableView!
    
    //MARK: Variables
    var arrDatesFirst = ["12 August", "13 August", "14 August", "15 August", "16 August"]
    var arrDatesSecond = ["12 June", "13 June", "14 June", "15 June", "16 June"]
    var arrTitles = ["First Year", "Second Year","Third Year"]
    var height: CGFloat = 0.0
    var tappedHeader = -1
    
    //MARK: Load
    override func viewDidLoad() {
        super.viewDidLoad()
        tblMain.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Actions
    @IBAction func btnHeaderAction(_ sender: UIButton) {
        if sender.tag == tappedHeader {
            height = 0
            tblMain.reloadData()
        }
        else {
            tappedHeader = sender.tag
            height = UIScreen.main.bounds.height - 140
            tblMain.reloadData()
        }
        
    }
    
}

extension MainVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
         if tableView.tag == 5{
             return 3
         }
         else if tableView.tag == 0{
             return arrDatesFirst.count
         }
         else{
             return arrDatesSecond.count
         }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView.tag == 5{
            return ""
        }
        else if tableView.tag == 0 {
            return arrDatesFirst[section]
        }
        else{
            return arrDatesSecond[section]
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView.tag == 5 {
            return 50
        }
        else {
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 5{
            return 1
        }
        else{
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableItemTCell") as! TableItemTCell
            //print("Section is: ", indexPath.section)
            cell.tblInside.tag = indexPath.row
            if indexPath.section == tappedHeader{
                cell.tblHeight.constant = height
                UIView.animate(withDuration: 0.3) {
                    self.view.layoutIfNeeded()
                }
            }
            else{
                cell.tblHeight.constant = 0
            }
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "insidecell")
            return cell!
        }
    }
    
}

extension MainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView.tag == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTCell") as! HeaderTCell
            cell.lblTitle.text = arrTitles[section]
            cell.btnHeader.tag = section
            return cell.contentView
        }
        else{
            return nil
        }
    }
}
