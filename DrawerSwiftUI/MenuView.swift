//
//  MenuView.swift
//  DrawerSwiftUI
//
//  Created by 矢守叡 on 2019/12/13.
//  Copyright © 2019 yamolean. All rights reserved.
//

import SwiftUI

struct MenuButton : View {
    @Binding var show : Bool
    var body: some View {
        Button(action: { self.show.toggle() }) {
            Image(systemName: "list.dash")
                .foregroundColor(.black)
        }
    }
}

struct Menu : Identifiable {
    var id = UUID()
    var title : String
    var icon : String
}

let menuData = [
    Menu(title: "My Account", icon: "person.crop.circle"),
    Menu(title: "Billing", icon: "creditcard"),
    Menu(title: "Team", icon: "person.and.person"),
    Menu(title: "Sign out", icon: "arrow.uturn.down")
]

struct MenuView : View {
    var menu = menuData
    @Binding var show : Bool
    @State var showSettings = false
    
    var body: some View {
        return HStack {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(menu) { item in
                    MenuRow(image: item.icon, text: item.title)
                }
                Spacer()
            }
            .padding(30)
            .frame(minWidth: 0, maxWidth: 360)
            .background(Color.white)
            .cornerRadius(30)
            .padding(.trailing, 60)
            .shadow(radius: 20)
            .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10.0, z: 0))
            .animation(.default)
            .offset(x: show ? 0 : -UIScreen.main.bounds.width)
            .onTapGesture {
                self.show.toggle()
            }
            Spacer()
        }
    }
}

struct MenuRow : View {
    var image = "creditcard"
    var text = "My Account"
    var body: some View {
        HStack {
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(Color.black)
                .frame(width: 32, height: 32)
            Text(text)
                .font(.headline)
            Spacer()
        }
    }
}
