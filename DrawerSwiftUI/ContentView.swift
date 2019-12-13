//
//  ContentView.swift
//  DrawerSwiftUI
//
//  Created by 矢守叡 on 2019/12/13.
//  Copyright © 2019 yamolean. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    
    var body: some View {
        ZStack {
            Color.white
            MenuButton(show: $show)
            MenuView(show: $show)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

