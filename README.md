# mongo-replica-mongo:4.4.6

# Setup MongoDB Replica Set mongo-replica-mongo:4.4.6

## Create RS Keyfile for MongoDB

Generate a keyfile for MongoDB replica set authentication:
```bash
openssl rand -base64 756 > ${PWD}/rs_keyfile
chmod 0400 ${PWD}/rs_keyfile
chown 999:999 ${PWD}/rs_keyfile
```
## Set permanent primary MongoDB
Initialize the primary MongoDB instance (mongo1_7) as the primary in the replica set:
```bash
rs.initiate({
  _id: "rs0",
  members: [
    { _id: 0, host: "mongo1_7:27021", priority: 2 }, // Higher priority to prefer as primary
    { _id: 1, host: "mongo2_7:27022", priority: 1 },
    { _id: 2, host: "mongo3_7:27023", priority: 1 }
  ]
});

```
## RECONFIG_REPLICA MONGODB
If needed, reconfigure the replica set (rs0) to update member configuration:
```bash
rs.reconfig({
  _id: "rs0",
  members: [
    { _id: 0, host: "mongo1:27034", priority: 2 },
    { _id: 1, host: "mongo2:27035", priority: 1 },
    { _id: 2, host: "mongo3:27036", priority: 1 }
  ]
});
```
