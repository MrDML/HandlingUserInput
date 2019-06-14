//
//  LandmarkDetail.swift
//  BuildingListsAndNavigation
//
//  Created by mac on 2019/6/13.
//  Copyright © 2019 mac. All rights reserved.
//

import SwiftUI

struct LandmarkDetail : View {
 
    @EnvironmentObject var userData: UserData // 数据源绑定后会自动回去其中的值

    var landmark: Landmark
 
    // 计算型属性：获取数据源中id和第0个数据源id相等的索引
    var landmarkIndex: Int {
        //        userData.landmarks.firstIndex { land -> Bool in
        //            if land.id == landmark.id{
        //                return true
        //            }else{
        //                return false
        //            }
        //        }!
        // Cannot convert return expression of type 'Array<Element>.Index?' (aka 'Optional<Int>') to return type 'Int'
        // var landmarkIndex: Int 这里定义的是一个确定值，但是返回的是一个可选值，需要强制解包
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }

    
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                    HStack {
                        Text(landmark.name)
                            .font(.title)
                        
                        Button(action: {
                            self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                        }) {
                            if self.userData.landmarks[self.landmarkIndex].isFavorite{
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color.yellow)
                            }else{
                                Image(systemName: "star")
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }
                
            
                    HStack(alignment: .top) {
                        Text(landmark.park)
                            .font(.subheadline)
                        Spacer()
                        Text(landmark.state)
                            .font(.subheadline)
                    }
                }
                .padding()
             Spacer()
        }
        .navigationBarTitle(Text(landmark.name),displayMode: .inline)
    }
}

#if DEBUG
struct LandmarkDetail_Previews : PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0]).environmentObject(UserData())
    }
}
#endif
