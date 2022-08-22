//
//  Movie+CoreDataProperties.swift
//  CDataTut
//
//  Created by Pat on 2022/08/22.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }
    
    //This is where our optional problem comes from
    //These properties are not actually here and these are reference variables
    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16

    //MARK: - Better option for dealing with our optional problem
    ///Computed Values, This is how we can make changes to default valies in one file
    public var wrappedTitle: String{
        title ?? "Unknown Title"
    }
}

extension Movie : Identifiable {

}
