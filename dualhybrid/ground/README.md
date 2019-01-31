# On-Prem

The scenario for the "on-prem" services is that you have data in your local databases that you want to expose via APIs to enrich the experience of the cloud based services.

In this simple example the on-prem database is an address book with contact details.

## [mongo](./mongo)
In this example, for the convenience of demoability, the database is transient. The sample data is loaded on startup.

## [addressbook](./addressbook)
The address book service is providing a readonly API for querying contacts in the addressbook.

## [addressbookcrud](./addressbookcrud)
This is the standard full CRUD API for the addressbook. This can be used to load additional data into the database or to manipulate the data for the demo.

## [helm/ground](./helm)
A helm chart that deploys the containers for the ground setup.