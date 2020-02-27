// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// Githubv4API namespace
public enum Githubv4API {
  public final class ShowViewerQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query ShowViewer {
        viewer {
          __typename
          id
          name
          email
          avatarUrl
          company
        }
      }
      """

    public let operationName: String = "ShowViewer"

    public init() {
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("viewer", type: .nonNull(.object(Viewer.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(viewer: Viewer) {
        self.init(unsafeResultMap: ["__typename": "Query", "viewer": viewer.resultMap])
      }

      /// The currently authenticated user.
      public var viewer: Viewer {
        get {
          return Viewer(unsafeResultMap: resultMap["viewer"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "viewer")
        }
      }

      public struct Viewer: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
          GraphQLField("company", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil, email: String, avatarUrl: String, company: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "email": email, "avatarUrl": avatarUrl, "company": company])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The user's public profile name.
        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// The user's publicly visible profile email.
        public var email: String {
          get {
            return resultMap["email"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
          }
        }

        /// A URL pointing to the user's public avatar.
        public var avatarUrl: String {
          get {
            return resultMap["avatarUrl"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "avatarUrl")
          }
        }

        /// The user's public profile company.
        public var company: String? {
          get {
            return resultMap["company"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "company")
          }
        }
      }
    }
  }
}
