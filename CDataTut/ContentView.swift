//
//  ContentView.swift
//  CDataTut
//
//  Created by Pat on 2022/08/22.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var countries: FetchedResults<Country>
    
    var body: some View {
        //two for each one for a section for the country and another for the list in each country
        VStack{
            List {
                ForEach(countries, id: \.self) { country in
                    Section(header: Text(country.wrappedFullName)) {
                        ForEach(country.candyArray, id: \.self) { candy in
                            Text(candy.wrappedName)
                        }
                    }
                }
            }
            Button("Add Examples"){
                let candy1 = Candy(context: moc)
                candy1.name = "Mars"
                candy1.origin = Country(context: moc)
                candy1.origin?.shortName = "UK"
                candy1.origin?.fullName = "United Kingdom"
                
                let candy2 = Candy(context: moc)
                candy2.name = "KitKat"
                candy2.origin = Country(context: moc)
                candy2.origin?.shortName = "UK"
                candy2.origin?.fullName = "United Kingdom"
                
                let candy3 = Candy(context: moc)
                candy3.name = "TWix"
                candy3.origin = Country(context: moc)
                candy3.origin?.shortName = "UK"
                candy3.origin?.fullName = "United Kingdom"
                
                let candy4 = Candy(context: moc)
                candy4.name = "Toblerone"
                candy4.origin = Country(context: moc)
                candy4.origin?.shortName = "CH"
                candy4.origin?.fullName = "Switzerland"
                
                try? moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//MARK: - Dynamic Filter View
struct DynamicView: View{
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    var body: some View{
        VStack{
            //List of matching Singers
            //specifying the singer here makes it so the generic dynamic list knows that were looking for a singer
            FilteredList(filterKey: "lastName", filterValue: lastNameFilter, content: {(singer:Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            })
            
            Button("Add Examples"){
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? moc.save()
            }
            Button("Show A"){
                lastNameFilter = "A"
            }
            
            Button("Show S"){
                lastNameFilter = "S"
            }
            
        }
    }
}

//MARK: - Static Filtering
struct StaticFiltering: View{
    @Environment(\.managedObjectContext) var moc
    //Predicates
    /// "universe IN %@", ["Aliens","Firefly","Star Trek"] -- gives you items from those arrays
    /// "name BEGINSWITH %@", "E"  -- Everyhting with E which is case sensative
    /// "name BEGINSWITH[c]  %@" , "e"  -- Case insensatve search
    ///  "NOT name BEGINSWITH[c]  %@, "e""
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name < %@", "F")) var ships: FetchedResults<Ship>
    
    
    var body: some View{
        VStack{
            List(ships, id: \.self){ ship in
                Text(ship.name ?? "UNK")
            }
            
            Button("Add Examples"){
                let ship1 = Ship(context: moc)
                ship1.name = "Enterprise"
                ship1.universe = "Star Trek"
                
                let ship2 = Ship(context: moc)
                ship2.name = "Defiant"
                ship2.universe = "Star Trek"
                
                let ship3 = Ship(context: moc)
                ship3.name = "Millennium Falcon"
                ship3.universe = "Star Wars"
                
                let ship4 = Ship(context: moc)
                ship4.name = "Executor"
                ship4.universe = "Star Wars"
                
                try? moc.save()
            }
        }
    }
}

//MARK: - Wizard with same name
struct WizTest: View{
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View{
        VStack{
            List(wizards,id:\.self){ wizard in
                Text(wizard.name ?? "UNK")
            }
            Button("Add"){
                let wizard = Wizard(context: moc)
                wizard.name = "Harry"
            }
            Button("Save"){
                do{
                    try moc.save()
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}


//        Button("Save"){
//            //MARK: - Check for changes
//            if moc.hasChanges{
//                try? moc.save()
//            }
//        }
