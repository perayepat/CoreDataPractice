//
//  DataController.swift
//  CDataTut
//
//  Created by Pat on 2022/08/22.
//

import Foundation
import CoreData

/// `Observable` allows this to stay alive as long as the app runs
class DataController: ObservableObject{
    ///`NSPersistantContainer` responsible for loading the model and giving us data on the side
    
    let container = NSPersistentContainer(name:"CoreDataProject") //  Prepare core data model loading and saving
    
    //Load
    init(){
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
            //MARK: -  Solution For multiple data problem we made
            /// - this merged all the instances into one object by merging properties of the old and new together
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}

