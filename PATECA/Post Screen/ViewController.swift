//
//  ViewController.swift
//  beta_PaTeca
//
//  Created by 高橋ゆうき on 2020/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var post = Post.allPosts
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Viewへ登録する
        let nib = UINib(nibName: "PostTableViewCell", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "postCell")
        
        
        
        
    }

    
}
    
extension ViewController: UITableViewDataSource {
    
    func numberOfsectionInTableView(tableView: UITableView) -> Int{
        //Tableの中にどれだけセクション（区切り）をつけるか
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Tableで見るポストの数
        return post.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath as IndexPath) as! UITableViewCell
        
        cell.post = post[indexPath.row]
        
        return cell
    }
    
}



