//
//  ContactsFeatureView.swift
//  Counter
//
//  Created by Lameirão Lima on 30/01/24.
//

import SwiftUI
import ComposableArchitecture

struct ContactsFeatureView: View {
    @Bindable var store: StoreOf<ContactsFeature>
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(store.contacts) { contact in
                    Text(contact.name)
                }
            }
            .navigationTitle("Contacts")
            .toolbar {
                ToolbarItem {
                    Button {
                        store.send(.addButtonTapped)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(
            item: $store.scope(state: \.addContact, action: \.addContact)
        ) { addContactStore in
            NavigationStack {
                AddContactFeatureView(store: addContactStore)
            }
        }
    }
}

#Preview {
    ContactsFeatureView(
        store: Store(
            initialState: ContactsFeature.State(
                contacts: [
                    Contact(id: UUID(), name: "Lalli"),
                    Contact(id: UUID(), name: "Lalli Jr"),
                    Contact(id: UUID(), name: "Lalli Sr"),
                ]
            )
        ) {
            ContactsFeature()
        }
    )
}
