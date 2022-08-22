//
//  Candy+CoreDataProperties.swift
//  CDataTut
//
//  Created by Pat on 2022/08/22.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?
    
    public var wrappedName: String{
        name ?? "Unk Candy"
    }
    
}

extension Candy : Identifiable {

}
