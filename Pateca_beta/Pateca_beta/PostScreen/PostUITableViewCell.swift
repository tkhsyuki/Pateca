//
//  PostUITableViewCell.swift
//  beta_PaTeca
//
//  Created by 高橋ゆうき on 2020/10/22.
//　タイムラインのポスト

import UIKit

class PostUITableViewCell: UITableViewCell {

    
    //ユーザー画像
    @IBOutlet weak var userProfilePic: UIImageView!
    
    //ユーザーネーム
    @IBOutlet weak var usernameLabel: UILabel!
    //投稿日
    @IBOutlet weak var CreatedAt: UILabel!
    
    //投稿画像
    @IBOutlet weak var postImage: UIImageView!
    //投稿文
    @IBOutlet weak var postText: UILabel!
    
    //いいねボタン
    @IBOutlet weak var LikeButton: UIButton!
    //リツイートボタン
    @IBOutlet weak var RetweetButtun: UIButton!
    //投げ銭ボタン
    @IBOutlet weak var Point: UIButton!
    
    
    var post: Post!{
        didSet {//PostからUIを取得して更新
            updateUI()
        }
    }
    
    //POST UI
    private func updateUI(){
        //ユーザー画像を円に
        userProfilePic.layer.cornerRadius = userProfilePic.layer.bounds.width/2
        userProfilePic.clipsToBounds = true
        
        //postを円に
        postImage.layer.cornerRadius = 5.0
        postImage.clipsToBounds = true
        
        //post UIに画像、数値を割当
        userProfilePic.image! = post.user.profileImage
        usernameLabel.text! = post.user.fullName
        CreatedAt.text! = post.createdAt
        postImage.image = post.postImage
        postText.text! = post.postText
        
        configureButtonAppearance()
        
    }
    
    //ボタン　UI
    private func configureButtonAppearance(){
       
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //いいねボタンが押された時
    @IBAction func LikeButtonClicked() {
        
       
    }
    
    
    @IBAction func RetweetButtonClicked() {
    }
}
