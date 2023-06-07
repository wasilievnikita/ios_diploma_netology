//
//  Post.swift
//  Navigation
//
//  Created by Никита Васильев on 10.05.2023.
//

import UIKit

struct Post {
    let author: String
    let description: String
    let photo: String
    var likes: Int
    var views: Int
    var islike = false
    
    static func maketPost() -> [Post] {
        var post = [Post]()
        
        post.append( Post(author: "Jack", description: "Balloon party  #birthday #friends", photo: "pic1", likes: 123, views: 456))
        post.append(Post(author: "Bob", description: "Cowboy boys #memories", photo: "pic2", likes: 456, views: 789))
        post.append(Post(author: "Sam", description: "Drinking beer with guys  #beer", photo: "pic3", likes: 789, views: 123))
        post.append(Post(author: "Shaggy", description: "", photo: "pic4", likes: 246, views: 369))
        return post
    }
}
var posts = Post.maketPost()
var post: Post?


