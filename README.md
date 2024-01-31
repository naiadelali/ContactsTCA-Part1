# README: App "Contacts" com Arquitetura Componível (TCA)

Estudo part 1: https://github.com/naiadelali/CounterTCA

Estudo part 2: https://github.com/naiadelali/CounterTCA-Part2

## Visão Geral

O app "Contacts" é um exemplo prático de como utilizar a Arquitetura Componível (TCA) para criar um aplicativo SwiftUI eficiente e bem estruturado. Este projeto foca na comunicação entre funcionalidades pai e filha, gerenciamento de apresentação de views e uso de ações delegadas para uma arquitetura limpa e escalável.

## Funcionalidades

- **Listagem de Contatos (`ContactsFeature`)**: Exibe uma lista de contatos com a opção de adicionar novos contatos.
- **Adicionar Contato (`AddContactFeature`)**: Permite a criação de novos contatos e integra-se à lista de contatos principal.

## Conceitos Principais

1. **Integração de Reducers**: Uso de `@Presents` para gerenciar a apresentação da funcionalidade de adicionar contato e integração com a funcionalidade principal de listagem de contatos.

2. **Ações Delegadas**: Implementação de ações delegadas para comunicação clara entre a funcionalidade filha e a funcionalidade pai.

3. **Uso de `DismissEffect`**: Autonomia da funcionalidade filha para se descartar, simplificando a lógica de cancelamento e descarte.

4. **Refinamento e Simplificação**: Remoção de ações de cancelamento desnecessárias e simplificação do reducer principal.

5. **Integração das Views**: Apresentação da `AddContactView` a partir da `ContactsView` usando `.sheet` e `@Bindable`.

## Estrutura do Projeto

- **ContactsFeature.swift**: Contém a lógica e a view para a listagem de contatos.
- **AddContactFeature.swift**: Contém a lógica e a view para adicionar novos contatos.
- **Modelos**: `Contact` representa o modelo de dados para um contato.# ContactsTCA-Part1
