//
//  ViewController.swift
//  Taskmate_alpha
//
//  Created by Daniel Tse on 13/11/2014.
//  Copyright (c) 2014 Daniel Tse. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var items: [String] = ["We", "Heart", "Swift"]
    
    var toDoItems: NSMutableArray = []
    
    func loadInitialData(){
        
        var item1 = ToDoItem(name: "Buy milk")
        self.toDoItems.addObject(item1)
        
        var item2 = ToDoItem(name: "Buy eggs")
        self.toDoItems.addObject(item2)
        
        var item3 = ToDoItem(name: "Read a book")
        self.toDoItems.addObject(item3)
        
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.toDoItems.count
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
//        var cell: UITableViewCell =
//            self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
//        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath:indexPath) as UITableViewCell
//        cell.textLabel.textColor = UIColor.blackColor()
//        cell.textLabel.text = self.items[indexPath.row]
            
        let CellIndentifier: NSString = "ListPrototypeCell"
            
        var cell : UITableViewCell
            
            = tableView.dequeueReusableCellWithIdentifier(CellIndentifier) as UITableViewCell
            
        var todoitem: ToDoItem = self.toDoItems.objectAtIndex(indexPath.row) as ToDoItem
            
        cell.textLabel.text = todoitem.itemName
            
            if todoitem.completed{
                
                cell.accessoryType = .Checkmark
                
            }
                
            else{
                
                cell.accessoryType = .None
                
            }
            
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        UITableViewCell selCell = tableView.cellForRowAtIndexPath(indexPath)
//        let indexPath = tableView.indexPathForSelectedRow();
        
//        let currentCell = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell!;
//        println(currentCell.textLabel.text)
        println("You selected cell #\(indexPath.row)! - ")
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        var tappedItem: ToDoItem = self.toDoItems.objectAtIndex(indexPath.row) as ToDoItem
        
        tappedItem.completed = !tappedItem.completed
        
        tableView.reloadData()
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue){
        
        var source: AddToDoViewController = segue.sourceViewController as AddToDoViewController
        
        var item: ToDoItem = source.toDoItem!
        
//        if item != nil {
        
            self.toDoItems.addObject(item)
            
            self.tableView.reloadData()
            
//        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadInitialData()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        

        
        
        
//        var camera = GMSCameraPosition.cameraWithLatitude(-33.868,
//            longitude:151.2086, zoom:6)
//        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera:camera)
//        
//        var marker = GMSMarker()
//        marker.position = camera.target
//        marker.snippet = "Hello World"
//        marker.appearAnimation = kGMSMarkerAnimationPop
//        marker.map = mapView
//        
//        self.view = mapView
        
//        self.view = CustomView()
        

//        var panoramaNear = CLLocationCoordinate2DMake(50.059139, -122.958391)
//        
//        var panoView = GMSPanoramaView.panoramaWithFrame(CGRectZero,
//            nearCoordinate:panoramaNear)
//        
//        self.view = panoView;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

