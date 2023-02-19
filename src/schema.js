const { gql } = require('apollo-server-express');

module.exports = gql`
  scalar DateTime

  type User {
    id: ID!
    username: String!
    email: String!
    avatar: String
    status: String!
  }

  type Query {
    user(username: String!): User
    users: [User!]!
    me: User!
  }

  type Mutation {
    signUp(username: String!, email: String!, status: String!, password: String!): String!
    signIn(username: String, email: String, password: String!): String!
  }
`;
