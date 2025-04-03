// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension CustomLaunchAPI {
  class UpcomingLaunchesOverviewQuery: GraphQLQuery {
    static let operationName: String = "UpcomingLaunchesOverview"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query UpcomingLaunchesOverview($limit: Int = 5) { upcomingLaunches(limit: $limit) { __typename id name net status { __typename name abbrev description } pad { __typename country } image { __typename id name imageUrl thumbnailUrl } } }"#
      ))

    public var limit: GraphQLNullable<Int>

    public init(limit: GraphQLNullable<Int> = 5) {
      self.limit = limit
    }

    public var __variables: Variables? { ["limit": limit] }

    struct Data: CustomLaunchAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { CustomLaunchAPI.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("upcomingLaunches", [UpcomingLaunch].self, arguments: ["limit": .variable("limit")]),
      ] }

      var upcomingLaunches: [UpcomingLaunch] { __data["upcomingLaunches"] }

      /// UpcomingLaunch
      ///
      /// Parent Type: `Launch`
      struct UpcomingLaunch: CustomLaunchAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { CustomLaunchAPI.Objects.Launch }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", CustomLaunchAPI.ID.self),
          .field("name", String.self),
          .field("net", String.self),
          .field("status", Status.self),
          .field("pad", Pad.self),
          .field("image", Image?.self),
        ] }

        var id: CustomLaunchAPI.ID { __data["id"] }
        var name: String { __data["name"] }
        var net: String { __data["net"] }
        var status: Status { __data["status"] }
        var pad: Pad { __data["pad"] }
        var image: Image? { __data["image"] }

        /// UpcomingLaunch.Status
        ///
        /// Parent Type: `LaunchStatus`
        struct Status: CustomLaunchAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { CustomLaunchAPI.Objects.LaunchStatus }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String.self),
            .field("abbrev", String.self),
            .field("description", String?.self),
          ] }

          var name: String { __data["name"] }
          var abbrev: String { __data["abbrev"] }
          var description: String? { __data["description"] }
        }

        /// UpcomingLaunch.Pad
        ///
        /// Parent Type: `LaunchPad`
        struct Pad: CustomLaunchAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { CustomLaunchAPI.Objects.LaunchPad }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("country", String.self),
          ] }

          var country: String { __data["country"] }
        }

        /// UpcomingLaunch.Image
        ///
        /// Parent Type: `ImageInfo`
        struct Image: CustomLaunchAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { CustomLaunchAPI.Objects.ImageInfo }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", CustomLaunchAPI.ID?.self),
            .field("name", String?.self),
            .field("imageUrl", String?.self),
            .field("thumbnailUrl", String?.self),
          ] }

          var id: CustomLaunchAPI.ID? { __data["id"] }
          var name: String? { __data["name"] }
          var imageUrl: String? { __data["imageUrl"] }
          var thumbnailUrl: String? { __data["thumbnailUrl"] }
        }
      }
    }
  }

}