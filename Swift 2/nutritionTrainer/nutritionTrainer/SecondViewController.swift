//
//  SecondViewController.swift
//  nutritionTrainer
//
//  Created by Lisa on 6/20/16.
//  Copyright © 2016 Sascha Luna. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate {
    
    // MARK: Variable declaration
    var foodArray = [String]()
    
    // MARK: IBOutlets and IBActions
    @IBOutlet weak var TableView: UITableView!
    
    
    // MARK: Setup functions
    override func viewDidLoad() {
        super.viewDidLoad()
        makeHttpRequest()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: TableView
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = self.foodArray[indexPath.row]
        return cell
    }
    
    
    // MARK: Search
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String?) -> Bool {
        self.makeHttpRequest(searchString!)
        return true
    }
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        self.makeHttpRequest(self.searchDisplayController!.searchBar.text!)
        return true
    }
    
    
    // MARK: Http request
    func makeHttpRequest(searchParams: String = "apple") {
        let baseUrl = "http://api.nal.usda.gov/ndb/search/?format=json&api_key=DEMO_KEY"
        let params = baseUrl + "&q=\(searchParams)"
        
        let url = NSURL(string: params)
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "GET"
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil {
                print(error)
                return
            }
            
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                
                if let items = json["item"] as? [[String: AnyObject]] {
                    for item in items {
                        if let name = item["name"] as? String {
                            self.foodArray.append(name)
                        }
                    }
                }
            } catch {
                print("error serializing JSON: \(error)")
            }
        }
        
        task.resume()
    }
}
