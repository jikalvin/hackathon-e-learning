const { gql } = require('apollo-server-express');

module.exports = gql`
  scalar DateTime

  type User {
    id: ID!
    username: String!
    email: String!
    avatar: String
    status: String!
    courses: [Course!]!
  }

  type Course {
    id: ID!
    name: String!
    instructor: String!
    numberOfStudents: Int!
    takenBy: [User]
    modules: [Module]
  }

  type Module {
    id: ID!
    name: String!
    linkPdf: String!
    linkVideo: String!
    course: Course!
  }

  type Query {
    user(username: String!): User
    users: [User!]!
    me: User!
  }

  type Mutation {
    newCourse: Course
    deleteCourse(id: ID!): Boolean!
    enrolCourse(id: ID!): Course!
    newModule(name: String!, linkPdf: String!, linkVideo:String!, courseId:String!): Module!
    deleteModule(id: String!): Boolean!
    getModules(id: ID!): [Module!]!
    signUp(username: String!, email: String!, status: String!, password: String!): String!
    signIn(username: String, email: String, password: String!): String!
  }
`;
