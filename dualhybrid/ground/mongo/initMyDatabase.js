db = db.getSiblingDB('addressbook');
db.contacts.drop();
db.createCollection('contacts',{ capped : true, autoIndexId : true, size : 6142800, max : 10000 });

db.contacts.insert({
  firstname: 'Clint',
  surname: 'Eastwood',
  email: 'clint@western.com',
  address: {
    street: 'Mission Ranch',
    city: 'Carmel',
    state: 'CA',
    country: 'us',
    zip: '93923'
  }
})
db.contacts.insert({
  firstname: 'Paul',
  surname: 'Hewson',
  email: 'bono@u2.ie',
  address: {
    street: 'Vico Rd',
    city: 'Killiney',
    state: 'Dublin',
    country: 'ie',
    zip: ''
  }
})
db.contacts.insert({
  firstname: 'Theresa',
  surname: 'May',
  email: 'pm@uk.gov',
  address: {
    street: '10 Downing Street',
    city: 'London',
    state: 'London',
    country: 'uk',
    zip: 'SW1A 2AA'
  }
})