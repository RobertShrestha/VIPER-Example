//
//  PostListingViewController.swift
//  VIPER-Demo
//
//  Created by Robert Shrestha on 1/20/19.
//  Copyright © 2019 robert. All rights reserved.
//

import UIKit

class PostListingViewController: UIViewController {
    var presentor:ViewToPresenterProtocol?
    @IBOutlet weak var tableView:UITableView!
    
    var postArrayList:Array<PostsModel>  = Array()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Posts"
        presentor?.startFetchingPosts()
        showProgressIndicator(view: self.view)
        
        tableView.delegate = self
        tableView.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    

  
}
extension PostListingViewController:PresenterToViewProtocol{
    func showPosts(postArray: Array<PostsModel>) {
        self.postArrayList = postArray
        self.tableView.reloadData()
        hideProgressIndicator(view: self.view)
    }
    
    func showError(error: Error) {
        hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Alert", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
extension PostListingViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let postModel = self.postArrayList[indexPath.row]
        cell.textLabel?.text = postModel.title ?? ""
        cell.detailTextLabel?.text = postModel.body ?? ""
        return cell
    }
    
    
}
