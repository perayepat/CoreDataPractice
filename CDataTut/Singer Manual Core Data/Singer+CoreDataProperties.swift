//
//  Singer+CoreDataProperties.swift
//  CDataTut
//
//  Created by Pat on 2022/08/22.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?

    var wrappedFirstName: String{
        firstName ?? "Unk"
    }
    
    var wrappedLastName: String{
        lastName ?? "Unk"
    }
}

extension Singer : Identifiable {

}
