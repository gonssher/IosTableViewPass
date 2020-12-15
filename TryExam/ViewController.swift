//
//  ViewController.swift
//  TryExam
//
//  Created by Sherwin Gonsalves on 2020-12-14.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var segmentCot: UISegmentedControl!
    
    var details = [[String:Any]]() // array of dictionaries
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Final Exam"
        segmentCot.selectedSegmentIndex = 0
        
        if segmentCot.selectedSegmentIndex == 0
        {
            getDataDev()
        }
       
   
    }

    
    @IBAction func ChangedSegme(_ sender: Any) {
        
        
        
        if segmentCot.selectedSegmentIndex == 0
        {
    
            getDataDev()
            
        }
        else if segmentCot.selectedSegmentIndex == 1
        {
            getdataSales()
        }
        
        
    }
    func getdataSales() {
        
        guard let url = URL(string:"https://mohameom.dev.fast.sheridanc.on.ca/network/file.json") else {return}
        let task = URLSession.shared.dataTask(with: url){
            (data , response , error) in
            if let data = data, error == nil {
            do{
          
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any] else {
                    return
                }
   
                if let main = json["employees"] as? Dictionary<String, Any>
                {
                    if  let saleTeam = main["developers"] as?  [[String:Any]]
                    
                    {
                        self.details = saleTeam
                        print(saleTeam)
                    }
                }
                
                DispatchQueue.main.async
                {
                    self.tableView.reloadData()
                }

            }catch{
                print("error!")
            }
            
            }
          
        }
        task.resume()
        
    }
    
    
    
    func getDataDev()
    {
        guard let url = URL(string:"https://mohameom.dev.fast.sheridanc.on.ca/network/file.json") else {return}
        let task = URLSession.shared.dataTask(with: url){
            (data , response , error) in
            if let data = data, error == nil {
            do{
          
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any] else {
                    return
                }
   
                if let main = json["employees"] as? Dictionary<String, Any>
                {
                    if  let saleTeam = main["sales"] as?  [[String:Any]]
                    
                    {
                        self.details = saleTeam
                        print(saleTeam)
                    }


                }
                
                DispatchQueue.main.async
                {
                    self.tableView.reloadData()
                }

            }catch{
                print("error!")
            }
            
            }
          
        }
        task.resume()
        
        
    }
    
    
     func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return details.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
        withIdentifier: "cell", for: indexPath)
        let index = indexPath.row // get selected index
        let group = details[index] // get a group
        cell.textLabel?.text = group["name"] as? String ?? ""
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segue"
        
        {
            if let vc = segue.destination as? PassViewController
            {
            // get row index
            let index = tableView.indexPathForSelectedRow?.row ?? 0
            let group = details[index] // get the group as [String:Any]
            // convert member IDs to names

                if let phone = details[index]["phone"] as? [[String: Any]] {
                    for nums in phone {
                        vc.cellphone = "\(nums["mobile"] ?? 0)"
                        vc.landlineNumebr = "\(nums["land"] ?? 0)"
                    }
                }
    
            vc.userEmail = group["email"] as? String ?? ""
            vc.userName = group["name"] as? String ?? ""
            
                
                
                

            }
            
            
        }
        
    }
    


  
   
  

}

