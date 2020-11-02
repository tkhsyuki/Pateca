import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //サンプルデータをpostに格納する
    var post = Post.allPosts
    
    //まずここが実施される
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //StoryBord上で作っていないのでViewへ登録する
        
        //PostUITableViewCellを登録
        let nib = UINib(nibName: "PostUITableViewCell", bundle: nil)
       
        //XibファイルのIdentifer "postCellを登録"（ユーザーのpost)
        tableView.register(nib, forCellReuseIdentifier: "postCell")
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "postCell")
        
        
        
        
    }

    
}
    
extension ViewController: UITableViewDataSource {
    
    func numberOfsectionInTableView(tableView: UITableView) -> Int{
        //Tableの中にどれだけセクション（区切り）をつけるか
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Tableで見るポストの数 現時点で４つ
        return post.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //cell に再利用できるpostCellを代入
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostUITableViewCell
        
        cell.post = post[indexPath.row]
        
        print("OK")

        
        return cell
    }
    
}

