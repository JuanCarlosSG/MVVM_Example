//
//  MainView.swift
//  MVVM Example
//
//  Created by Juan Carlos on 27/04/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            TabView {
               TodoListView()
//                TodoListView_State_NavLink()
                    .tabItem {
                        VStack {
                            Image(systemName: "checklist")
                            Text("ToDos")
                        }
                    }
                Text("Second Tab")
                     .tabItem {
                         VStack {
                             Image(systemName: "numbersign")
                             Text("Tab 2")
                         }
                     }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
