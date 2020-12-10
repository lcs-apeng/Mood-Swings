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
        Parent(name: "HAPPY:)", children: [
            
            Child(name: "AWESOME!",
                  description: "Thats so good that you're happy! Keep it going!",
                  imageName: "happypic"),
            Child(name: "Things you can do...",
                  description: "You might be having an awesome day, which is great, but have you noticed anyone around you that feels a little down today? Go check on them! Help others out as well!",
                  imageName: "kindpic"),
            
            
            
        ]),
        Parent(name: "TIRED:/", children: [
            
            Child(name: "It's fine to have some bad days",
                  description: "It's normal to feel tired somedays, if you think carefully, did I sleep well last night? Did I have too much caffine last night? Or do I just need a nap and take this day off? And try to avoid those things that may affect your mood and mind.",
                  imageName: "tiredpic"),
            Child(name: "Solutions I might consider",
                  description: "GET MOVING! Go to the gym, when you're active, you're most likley to feel so much better, workout, and eat fruits to boost up your vitamins! Also drinking water is very critical dehydrated may also lead to tiredness, cut out alcohol, and caffine for the day. PSST! take a whiff of cinnamon stick, it helps! ",
                  imageName: "tiredpictwo"),
            
        ]),
        Parent(name: "SAD:(", children: [
            
            Child(name: "BREATHE",
                  description: "I know this might not be what you're thinking, but take a minute to just breathe, take the time to think, and calm down.",
                  imageName: "sadpictwo"),
            Child(name: "Things to consider...",
                  description: "You can try to talk to someone that might understand the situation you're in, overall, getting all your problems out and just having someone to talk to will make you feel so much better. Force yourself to leave the situation you're in cut away all the toxiness. Focus on yourself, not others.",
                  imageName: "sadpicb"),
            Child(name: "It's going to be okay.",
                  description: "I know this might not be what you're thinking right now, but it's going to be okay, it always does, just stop stressing, and focus on what you can do at the moment.",
                  imageName: "sadpic"),
            
        ]),
    ]
    
    // Selected top level option
    @State var selectedTopLevelOption = 0
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section{
                    Image("coverpic")
                        .resizable()
                        .padding(.all)
                        .scaledToFit()
                    
                }
                
                Section {
                    Button(action: {
                        // Ask User for permission to send notifications
                        askNotificationPermission()
                        // Send a notification (change timeUntil & message for each new one)
                        publishNotifications(timeUntil: 10, title:  "Mood Swings", message: "Be happy")
                        
                    }, label: {
                        Text("Would you like a notification?")
                    })
                    Picker("How do I Feel Today...", selection: $selectedTopLevelOption) {
                        
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
            .navigationTitle("Mood Swings")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


