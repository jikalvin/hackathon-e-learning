# hackathon-e-learning

## Instructions
- Download and install mongodb from https://www.mongodb.com/try/download/community
- Create a new database, it should be named hackathonBase
- Add a `.env` file with the following configuration
```
DB_HOST=mongodb://localhost:27017/hackathonBase
JWT_SECRET=<Difficult to decypher string>
```
- Install all the packages in the `package.json` file using npm or yarn as follows
```
npm init
yarn
```
- To start the server use `yarn start`