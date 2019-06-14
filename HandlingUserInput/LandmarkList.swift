//
//  LandmarkList.swift
//  BuildingListsAndNavigation
//
//  Created by mac on 2019/6/13.
//  Copyright © 2019 mac. All rights reserved.
//


import SwiftUI

struct LandmarkList: View {
    
     //@State var showFavoritesOnly = false
    @EnvironmentObject var userData: UserData // 数据源绑定后会自动回去其中的值

    var body: some View {
        NavigationView {
            List {
                    Toggle(isOn: $userData.showFavoritesOnly) {
                        Text("Favorites only")
                    }
                    ForEach.init(userData.landmarks) { landmark in
                        if !self.userData.showFavoritesOnly  || landmark.isFavorite {
                            NavigationButton.init(destination: LandmarkDetail(landmark: landmark)){
                                
                                LandmarkRow(landmark: landmark)
                            }
                        }
                    }
                
                }
                .navigationBarTitle(Text("Landmarks"),displayMode: .inline)
            
        }
       
    }
}

struct LandmarkList_Previews: PreviewProvider {

    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"].identified(by: \.self)) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
            }
            .environmentObject(UserData())
       
    }
}

struct ListView : View {
    var body: some View {
        return List(landmarkData) { landmark in
            NavigationButton.init(destination: LandmarkDetail(landmark: landmark)){
                
                LandmarkRow(landmark: landmark)
            }
            
            }
            .navigationBarTitle(Text("Landmarks"),displayMode: .inline)
    }
}
