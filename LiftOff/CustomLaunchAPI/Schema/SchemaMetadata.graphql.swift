// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

protocol CustomLaunchAPI_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == CustomLaunchAPI.SchemaMetadata {}

protocol CustomLaunchAPI_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == CustomLaunchAPI.SchemaMetadata {}

protocol CustomLaunchAPI_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == CustomLaunchAPI.SchemaMetadata {}

protocol CustomLaunchAPI_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == CustomLaunchAPI.SchemaMetadata {}

extension CustomLaunchAPI {
  typealias SelectionSet = CustomLaunchAPI_SelectionSet

  typealias InlineFragment = CustomLaunchAPI_InlineFragment

  typealias MutableSelectionSet = CustomLaunchAPI_MutableSelectionSet

  typealias MutableInlineFragment = CustomLaunchAPI_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
      switch typename {
      case "Agency": return CustomLaunchAPI.Objects.Agency
      case "ImageInfo": return CustomLaunchAPI.Objects.ImageInfo
      case "Launch": return CustomLaunchAPI.Objects.Launch
      case "LaunchPad": return CustomLaunchAPI.Objects.LaunchPad
      case "LaunchStatus": return CustomLaunchAPI.Objects.LaunchStatus
      case "License": return CustomLaunchAPI.Objects.License
      case "Mission": return CustomLaunchAPI.Objects.Mission
      case "Orbit": return CustomLaunchAPI.Objects.Orbit
      case "Query": return CustomLaunchAPI.Objects.Query
      case "Rocket": return CustomLaunchAPI.Objects.Rocket
      case "WeatherData": return CustomLaunchAPI.Objects.WeatherData
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}