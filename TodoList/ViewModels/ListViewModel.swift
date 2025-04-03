//
//  ListViewModel.swift
//  TodoList
//
//  Created by Juan José Perálvarez Ortiz on 19/3/25.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published  var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemKey: String = "items_key"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let dataItems = UserDefaults.standard.data(forKey: itemKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: dataItems)
        else { return }
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func saveButtonPressed(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItemState(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }
    }
}
