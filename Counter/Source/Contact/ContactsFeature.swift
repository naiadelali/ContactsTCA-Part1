//
//  ContactsFeature.swift
//  Counter
//
//  Created by Lameirão Lima on 30/01/24.
//
import Foundation
import ComposableArchitecture

struct Contact: Equatable, Identifiable {
    let id: UUID
    var name: String
}

@Reducer
struct ContactsFeature {
    @ObservableState
    struct State: Equatable {
        /*Uso de @Presents: A macro Presents() é usada para criar um estado opcional (addContact) que representa a apresentação da funcionalidade "Adicionar Contato". Quando addContact é nil, a tela de adicionar contato não está sendo apresentada. Quando possui um valor, indica que a tela está ativa.
         @Presents é mais específico para gerenciar a visibilidade e a apresentação de componentes ou telas em uma aplicação SwiftUI.*/
        @Presents var addContact: AddContactFeature.State?
        var contacts: IdentifiedArrayOf<Contact> = []
    }
    
    enum Action {
        case addButtonTapped
        case addContact(PresentationAction<AddContactFeature.Action>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .addButtonTapped:
                   state.addContact = AddContactFeature.State(
                     contact: Contact(id: UUID(), name: "")
                   )
                   return .none
                //Este case é específico para quando a ação cancelButtonTapped é disparada na funcionalidade filha "Adicionar Contato".
                //O reducer responde a esta ação definindo state.addContact como nil, o que efetivamente descarta a tela de adicionar contato.
            //case .addContact(.presented(.cancelButtonTapped)): //ANTES
            /*case .addContact(.presented(.delegate(.cancel))): //NÃO PRECISA MAIS DEPOIS DE IMPLEMENTAR O DIMISS
                state.addContact = nil
                return .none*/
            //case .addContact(.presented(.saveButtonTapped)): ANTES
            case let .addContact(.presented(.delegate(.saveContact(contact)))):
                /*guard let contact = state.addContact?.contact
                else { return .none }*/
                state.contacts.append(contact)
               // state.addContact = nil
                return .none
            case .addContact:
                return .none
            }
        }
        /*Isso cria um novo reducer que executa o reducer filho quando uma ação filha entra no sistema e executa o reducer pai em todas as ações. Ele também lida automaticamente com o cancelamento de efeitos quando a funcionalidade filha é descartada, entre outras coisas. Veja a documentação para mais informações.*/
        .ifLet(\.$addContact, action: \.addContact) {
            AddContactFeature()
        }
    }
}
