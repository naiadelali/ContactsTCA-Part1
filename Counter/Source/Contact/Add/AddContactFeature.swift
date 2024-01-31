//
//  AddContactFeature.swift
//  Counter
//
//  Created by Lameirão Lima on 30/01/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct AddContactFeature {
    @ObservableState
    struct State: Equatable {
        var contact: Contact
    }
    enum Action {
        case cancelButtonTapped
        case delegate(Delegate)
        case saveButtonTapped
        case setName(String)
        /*novo enum Delegate para as ações da AddContactFeature. Este enum descreverá todas as ações que o pai pode ouvir e interpretar,
         permitindo que a funcionalidade filha diga diretamente ao pai o que deseja que seja feito*/
        enum Delegate: Equatable {
            //case cancel
            case saveContact(Contact)
        }
    }
    /*Use a dependência dismiss retornando um efeito e invocando-o. Isso comunicará com a funcionalidade pai para que uma ação PresentationAction.dismiss seja enviada, o que limpará o estado que está dirigindo a apresentação.
     Nota: A dependência dismiss é assíncrona, o que significa que é apropriado invocá-la apenas de um efeito.
     */
    @Dependency(\.dismiss) var dismiss
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                /* case .cancelButtonTapped:  //ANTES
                 return .none*/
            case .cancelButtonTapped:
                //return .send(.delegate(.cancel)) //ANTES
                return .run { _ in await self.dismiss() }
                
            case .delegate:
                return .none
                
                /* case .saveButtonTapped: //ANTES
                 return .none*/
                
            case .saveButtonTapped:
               // return .send(.delegate(.saveContact(state.contact))) //ANTES
                /* A mudança de return .send(.delegate(.saveContact(state.contact))) para usar um efeito return .run { ... } é uma adaptação para incluir a funcionalidade de descarte (dismiss) junto com o envio da ação delegada. Vamos analisar as diferenças:*/
                return .run { [contact = state.contact] send in
                        await send(.delegate(.saveContact(contact)))
                        await self.dismiss()
                      }
                
            case let .setName(name):
                state.contact.name = name
                return .none
            }
        }
    }
}
