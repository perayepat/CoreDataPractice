//
//  FilteredList.swift
//  CDataTut
//
//  Created by Pat on 2022/08/22.
//

import SwiftUI
import CoreData

//MARK: - Generic Dynamic Filter 

struct FilteredList<T: NSManagedObject, Content: View>: View {
    //Store request
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    
    //MARK: - Filter on key name
    //Create a fetch request with the current managed object
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content){
        self.content = content
        _fetchRequest  = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
    }
    var body: some View {
        List(fetchRequest, id: \.self){ item in
            self.content(item)
        }
    }
}

//struct FilteredList_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteredList()
//    }
//}
