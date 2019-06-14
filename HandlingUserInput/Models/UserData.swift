//
//  UserData.swift
//  HandlingUserInput
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019 mac. All rights reserved.
//

import SwiftUI
import Combine
/*
 UserData：可绑定对象
 要准备用户控制哪些特定地标是收藏夹，您首先将地标数据存储在可绑定对象中。
 
 可绑定对象是数据的自定义对象，可以从SwiftUI环境中的存储绑定到视图。SwiftUI监视可能影响视图的可绑定对象的任何更改，并在更改后显示正确的视图版本。
 
 订阅者：SwiftUI
 didChange: 发布者
 */
final class UserData : BindableObject{
    let  didChange = PassthroughSubject<UserData,Never>()
    // 给定初始值
    var showFavoritesOnly = false {
        didSet{
            didChange.send(self)
        }
    }
    // 将数据源赋值于landmarks
    var landmarks = landmarkData {
        didSet{
             didChange.send(self)
        }
    }

}
