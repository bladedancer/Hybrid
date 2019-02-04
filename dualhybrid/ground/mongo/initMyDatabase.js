db = db.getSiblingDB('addressbook');
db.contacts.drop();
db.createCollection('contacts',{ capped : true, autoIndexId : true, size : 6142800, max : 10000 });

db.contacts.insert({
  firstname: 'Pierre',
  surname: 'Deparis',
  email: 'axway.french.smith@gmail.com',
  address: {
    street: '55, Rue du Faubourg Saint-Honoré ',
    city: 'Paris',
    state: 'Paris',
    country: 'fr',
    zip: '75008'
  }
})
db.contacts.insert({
  firstname: 'Dave',
  surname: 'Dedub',
  email: 'axway.demo.bolger@gmail.com',
  address: {
    street: 'Leinster House, Kildare St',
    city: 'Dublin',
    state: 'Dublin',
    country: 'ie',
    zip: 'D2'
  }
})
db.contacts.insert({
  firstname: 'Diego',
  surname: 'Desol',
  email: 'axway.spanish.jones@gmail.com',
  address: {
    street: 'Moncloa Palace',
    city: 'Madrid',
    state: 'Madrid',
    country: 'es',
    zip: ''
  }
})