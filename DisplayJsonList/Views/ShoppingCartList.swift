//
//  ContentView.swift
//  DisplayJsonList
//
//  Created by Leone on 2/25/23.
//

import SwiftUI

struct ShoppingCartList: View {
    
    // Load the ViewModel
    var vm = JsonViewModel()
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    // Loop through the list of items
                    ForEach(vm.shoppingCart.items, id: \.id) { item in
                        // Make a separate section for each item
                        Section {
                            //Loop Through all of the SubItems
                            ForEach(item.subItems, id: \.id) { subItem in
                                // Upon click, show the detailed SubItem view
                                NavigationLink {
                                    SubItemView(subItem: subItem)
                                } label: {
                                    Label(subItem.name, systemImage: "shippingbox")
                                        .font(.headline)
                                }
                                
                            }
                            // Set a header for that section
                        } header: {
                            Text(item.itemName)
                        }
                        
                    } // Deletes the item, when swiped left
                    .onDelete { indices in
                        vm.shoppingCart.items.remove(atOffsets: indices)
                    }
                    
                }
            }
            .navigationTitle("Shopping Cart")
        }
    }
}

struct ShoppingCartList_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCartList()
    }
}
