// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension CustomLaunchAPI {
  class GetLaunchQuery: GraphQLQuery {
    static let operationName: String = "GetLaunch"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetLaunch($id: ID!) { launch(id: $id) { __typename id name net status { __typename name abbrev description } pad { __typename name latitude longitude location country mapUrl mapImage } rocket { __typename id name fullName } mission { __typename id name type description orbit { __typename name abbrev } agencies { __typename id name abbrev country description logo { __typename imageUrl thumbnailUrl credit license { __typename name link } } } infoUrls vidUrls } image { __typename id name imageUrl thumbnailUrl credit license { __typename name link } } weather { __typename temperature temperatureUnit windspeed windspeedUnit winddirection weathercode isDay description } } }"#
      ))

    public var id: ID

    public init(id: ID) {
      self.id = id
    }

    public var __variables: Variables? { ["id": id] }

    struct Data: CustomLaunchAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { CustomLaunchAPI.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("launch", Launch?.self, arguments: ["id": .variable("id")]),
      ] }

      var launch: Launch? { __data["launch"] }

      /// Launch
      ///
      /// Parent Type: `Launch`
      struct Launch: CustomLaunchAPI.SelectionSet {
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
          .field("rocket", Rocket.self),
          .field("mission", Mission?.self),
          .field("image", Image?.self),
          .field("weather", Weather?.self),
        ] }

        var id: CustomLaunchAPI.ID { __data["id"] }
        var name: String { __data["name"] }
        var net: String { __data["net"] }
        var status: Status { __data["status"] }
        var pad: Pad { __data["pad"] }
        var rocket: Rocket { __data["rocket"] }
        var mission: Mission? { __data["mission"] }
        var image: Image? { __data["image"] }
        var weather: Weather? { __data["weather"] }

        /// Launch.Status
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

        /// Launch.Pad
        ///
        /// Parent Type: `LaunchPad`
        struct Pad: CustomLaunchAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { CustomLaunchAPI.Objects.LaunchPad }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String.self),
            .field("latitude", Double.self),
            .field("longitude", Double.self),
            .field("location", String.self),
            .field("country", String.self),
            .field("mapUrl", String?.self),
            .field("mapImage", String?.self),
          ] }

          var name: String { __data["name"] }
          var latitude: Double { __data["latitude"] }
          var longitude: Double { __data["longitude"] }
          var location: String { __data["location"] }
          var country: String { __data["country"] }
          var mapUrl: String? { __data["mapUrl"] }
          var mapImage: String? { __data["mapImage"] }
        }

        /// Launch.Rocket
        ///
        /// Parent Type: `Rocket`
        struct Rocket: CustomLaunchAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { CustomLaunchAPI.Objects.Rocket }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", CustomLaunchAPI.ID.self),
            .field("name", String.self),
            .field("fullName", String?.self),
          ] }

          var id: CustomLaunchAPI.ID { __data["id"] }
          var name: String { __data["name"] }
          var fullName: String? { __data["fullName"] }
        }

        /// Launch.Mission
        ///
        /// Parent Type: `Mission`
        struct Mission: CustomLaunchAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { CustomLaunchAPI.Objects.Mission }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", CustomLaunchAPI.ID.self),
            .field("name", String?.self),
            .field("type", String?.self),
            .field("description", String?.self),
            .field("orbit", Orbit?.self),
            .field("agencies", [Agency?]?.self),
            .field("infoUrls", [String?]?.self),
            .field("vidUrls", [String?]?.self),
          ] }

          var id: CustomLaunchAPI.ID { __data["id"] }
          var name: String? { __data["name"] }
          var type: String? { __data["type"] }
          var description: String? { __data["description"] }
          var orbit: Orbit? { __data["orbit"] }
          var agencies: [Agency?]? { __data["agencies"] }
          var infoUrls: [String?]? { __data["infoUrls"] }
          var vidUrls: [String?]? { __data["vidUrls"] }

          /// Launch.Mission.Orbit
          ///
          /// Parent Type: `Orbit`
          struct Orbit: CustomLaunchAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { CustomLaunchAPI.Objects.Orbit }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("name", String.self),
              .field("abbrev", String.self),
            ] }

            var name: String { __data["name"] }
            var abbrev: String { __data["abbrev"] }
          }

          /// Launch.Mission.Agency
          ///
          /// Parent Type: `Agency`
          struct Agency: CustomLaunchAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { CustomLaunchAPI.Objects.Agency }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", CustomLaunchAPI.ID.self),
              .field("name", String.self),
              .field("abbrev", String.self),
              .field("country", String.self),
              .field("description", String?.self),
              .field("logo", Logo?.self),
            ] }

            var id: CustomLaunchAPI.ID { __data["id"] }
            var name: String { __data["name"] }
            var abbrev: String { __data["abbrev"] }
            var country: String { __data["country"] }
            var description: String? { __data["description"] }
            var logo: Logo? { __data["logo"] }

            /// Launch.Mission.Agency.Logo
            ///
            /// Parent Type: `ImageInfo`
            struct Logo: CustomLaunchAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: any ApolloAPI.ParentType { CustomLaunchAPI.Objects.ImageInfo }
              static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("imageUrl", String?.self),
                .field("thumbnailUrl", String?.self),
                .field("credit", String?.self),
                .field("license", License?.self),
              ] }

              var imageUrl: String? { __data["imageUrl"] }
              var thumbnailUrl: String? { __data["thumbnailUrl"] }
              var credit: String? { __data["credit"] }
              var license: License? { __data["license"] }

              /// Launch.Mission.Agency.Logo.License
              ///
              /// Parent Type: `License`
              struct License: CustomLaunchAPI.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: any ApolloAPI.ParentType { CustomLaunchAPI.Objects.License }
                static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .field("name", String?.self),
                  .field("link", String?.self),
                ] }

                var name: String? { __data["name"] }
                var link: String? { __data["link"] }
              }
            }
          }
        }

        /// Launch.Image
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
            .field("credit", String?.self),
            .field("license", License?.self),
          ] }

          var id: CustomLaunchAPI.ID? { __data["id"] }
          var name: String? { __data["name"] }
          var imageUrl: String? { __data["imageUrl"] }
          var thumbnailUrl: String? { __data["thumbnailUrl"] }
          var credit: String? { __data["credit"] }
          var license: License? { __data["license"] }

          /// Launch.Image.License
          ///
          /// Parent Type: `License`
          struct License: CustomLaunchAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { CustomLaunchAPI.Objects.License }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("name", String?.self),
              .field("link", String?.self),
            ] }

            var name: String? { __data["name"] }
            var link: String? { __data["link"] }
          }
        }

        /// Launch.Weather
        ///
        /// Parent Type: `WeatherData`
        struct Weather: CustomLaunchAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { CustomLaunchAPI.Objects.WeatherData }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("temperature", Double.self),
            .field("temperatureUnit", String.self),
            .field("windspeed", Double.self),
            .field("windspeedUnit", String.self),
            .field("winddirection", Double.self),
            .field("weathercode", Int.self),
            .field("isDay", Bool.self),
            .field("description", String.self),
          ] }

          var temperature: Double { __data["temperature"] }
          var temperatureUnit: String { __data["temperatureUnit"] }
          var windspeed: Double { __data["windspeed"] }
          var windspeedUnit: String { __data["windspeedUnit"] }
          var winddirection: Double { __data["winddirection"] }
          var weathercode: Int { __data["weathercode"] }
          var isDay: Bool { __data["isDay"] }
          var description: String { __data["description"] }
        }
      }
    }
  }

}