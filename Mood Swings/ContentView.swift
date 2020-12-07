//
//  ContentView.swift
//  Mood Swings
//
//  Created by amelia peng on 2020-12-03.
//

import SwiftUI

// By conforming to the Identifiable protocol, a type can be iterated over with the List view
struct Child: Identifiable {
    var id = UUID()         // Generate a unique identifier for an instance of this type
    var name: String
    var description: String
    var imageName: String
}

struct Parent {
    var name: String
    var children: [Child]
}

struct ContentView: View {
    
    // All top level options
    var topLevelOptions = [
        Parent(name: "Happy", children: [
            
            Child(name: "Awesome!!",
                  description: "Thats so good that you're happy! Keep it going!",
                  imageName: "happypic"),
            Child(name: "TIRED",
                  description: "I'm feeling tired...",
                  imageName: "image1b"),
            Child(name: "SAD",
                  description: "I'm kinda sad right now...",
                  imageName: "image1c"),

        ]),
        Parent(name: "Tired", children: [

            Child(name: "Option 2a",
                  description: "I feel tired and sleepy today.",
                  imageName: "image2a"),
            Child(name: "Option 2b",
                  description: "Some explanatory information about option 2b",
                  imageName: "image2b"),

        ]),
        Parent(name: "Sad", children: [

            Child(name: "Option 3a",
                  description: "Some explanatory information about option 3a",
                  imageName: "image3a"),
            Child(name: "Option 3b",
                  description: "Some explanatory information about option 3b",
                  imageName: "image3b"),
            Child(name: "Option 3c",
                  description: "Some explanatory information about option 3c",
                  imageName: "image3c"),
            Child(name: "Option 3d",
                  description: "Some explanatory information about option 3d",
                  imageName: "image3d"),

        ]),
    ]
    
    // Selected top level option
    @State var selectedTopLevelOption = 0
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section {
                    
                    Picker("Select a top level option", selection: $selectedTopLevelOption) {
                        
                        ForEach(0 ..< topLevelOptions.count) { index in
                            
                            Text(topLevelOptions[index].name)
                            
                        }
                        
                    }

                }
                
                Section {
                    
                    // Loop over all the children of the selected top level option
                    List(topLevelOptions[selectedTopLevelOption].children) { secondLevelOption in
                        
                        NavigationLink(secondLevelOption.name,
                                       destination: ChildDetailView(child: secondLevelOption))
                        
                    }

                }
                
            }
            .navigationTitle("Parent-Child Nav")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

