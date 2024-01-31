//
//  CounterApp.swift
//  Counter
//
//  Created by Lameirão Lima on 29/01/24.
//

import SwiftUI
import SwiftData
import ComposableArchitecture

@main
struct CounterApp: App {
    
    static let store = Store(initialState: ContactsFeature.State()) {
        ContactsFeature()
        /* Os reducers têm um método chamado _printChanges que é semelhante a uma ferramenta que o SwiftUI fornece. Quando usado, ele imprimirá no console cada ação que o reducer processa, e mostrará como o estado mudou após processar a ação. O método também se esforça para condensar a diferença de estado em uma forma compacta. Isso inclui não exibir o estado aninhado se ele não tiver mudado e não mostrar elementos em coleções que não mudaram.*/
        ._printChanges()
    }
    
    var body: some Scene {
        WindowGroup {
            ContactsFeatureView(store: CounterApp.store)
        }
       
    }
}
