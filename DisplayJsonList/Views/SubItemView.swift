//
//  SubItemView.swift
//  DisplayJsonList
//
//  Created by Leone on 2/26/23.
//

import SwiftUI

struct SubItemView: View {
    // Pass in a subItem from the above view
    let subItem: SubItem
    
    var body: some View {
        VStack {
            // Check to make sure that otherInfo is not nil
            if let otherInfo = subItem.otherInfo {
                Text(otherInfo)
            }
            // Else if nothing's set, then use this text instead
            else {
                Text("No more information for this item.")
            }
            
        }
        .navigationTitle(subItem.name)
    }
    
}

struct SubItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SubItemView(
                subItem: SubItem(
                    id: 0,
                    name: "Orange",
                    otherInfo: "The orange is a fruit of the citrus family."
                )
            )
        }
    }
}
