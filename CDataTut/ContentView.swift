//
//  ContentView.swift
//  CDataTut
//
//  Created by Pat on 2022/08/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//        Button("Save"){
//            //MARK: - Check for changes
//            if moc.hasChanges{
//                try? moc.save()
//            }
//        }
