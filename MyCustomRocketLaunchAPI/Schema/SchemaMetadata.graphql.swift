// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

protocol MyCustomRocketLaunchAPI_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == MyCustomRocketLaunchAPI.SchemaMetadata {}

protocol MyCustomRocketLaunchAPI_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == MyCustomRocketLaunchAPI.SchemaMetadata {}

protocol MyCustomRocketLaunchAPI_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == MyCustomRocketLaunchAPI.SchemaMetadata {}

protocol MyCustomRocketLaunchAPI_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == MyCustomRocketLaunchAPI.SchemaMetadata {}

extension MyCustomRocketLaunchAPI {
  typealias SelectionSet = MyCustomRocketLaunchAPI_SelectionSet

  typealias InlineFragment = MyCustomRocketLaunchAPI_InlineFragment

  typealias MutableSelectionSet = MyCustomRocketLaunchAPI_MutableSelectionSet

  typealias MutableInlineFragment = MyCustomRocketLaunchAPI_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
      switch typename {
      case "Agency": return MyCustomRocketLaunchAPI.Objects.Agency
      case "ImageInfo": return MyCustomRocketLaunchAPI.Objects.ImageInfo
      case "Launch": return MyCustomRocketLaunchAPI.Objects.Launch
      case "LaunchPad": return MyCustomRocketLaunchAPI.Objects.LaunchPad
      case "LaunchStatus": return MyCustomRocketLaunchAPI.Objects.LaunchStatus
      case "License": return MyCustomRocketLaunchAPI.Objects.License
      case "Mission": return MyCustomRocketLaunchAPI.Objects.Mission
      case "Orbit": return MyCustomRocketLaunchAPI.Objects.Orbit
      case "Query": return MyCustomRocketLaunchAPI.Objects.Query
      case "Rocket": return MyCustomRocketLaunchAPI.Objects.Rocket
      case "WeatherData": return MyCustomRocketLaunchAPI.Objects.WeatherData
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}