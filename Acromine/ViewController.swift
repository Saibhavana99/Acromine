//
//  ViewController.swift
//  Acromine
//
//  Created by Bhavana on 03/03/17.
//  Copyright © 2017 Sai Bhavana. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var resultTableView: UITableView!
    var resultData : NSArray = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultTableView.tableFooterView = UIView(frame: .zero)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: Tableview delegate methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as AcronymFullTableViewCell
        cell.fill(resultData.object(at: indexPath.row) as! NSDictionary)
        return cell
    }
}
extension ViewController: UISearchBarDelegate {
    
    func layoutSubviews() {
        searchBar.searchBarStyle = .minimal
    }
    // MARK: Searchbar delegate methods
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
    // Dismiss search keyboard
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
        // API Call for Acronyms
        //check network exists or not
        if Reachability.isConnectedToNetwork() == true {
            Loader.show(delegate: self)
            RootApi().fetchResource(searchBar.text!, completion: { (inner) in
                do {
                    guard let result = try inner() else { return }
                    DispatchQueue.main.async {
                        self.resultData = result
                        if self.resultData.count>0{
                        self.resultTableView.isHidden = false
                        }else{
                        self.resultTableView.isHidden = true
                        }
                        self.resultTableView.reloadData()
                        Loader.hide(delegate: self)
                    }
                } catch let error {
                    print("FAILED fetch onBoarding data: \(error)")
                    GenericMethods.sharedInstance.showAlertView("", Message:  "Request failed, please try again.", OkBtnTitle: "Ok", parentClass: self)
                    
                }
                
            })
        }else {
            GenericMethods.sharedInstance.showAlertView("", Message:  "Please check your connection and try again.", OkBtnTitle: "Ok", parentClass: self)
            
        }
        
        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
        }else{
            
            
        }
    }
}
