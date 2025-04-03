//
//  TodoListApp.swift
//  TodoList
//
//  Created by Juan José Perálvarez Ortiz on 18/3/25.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
