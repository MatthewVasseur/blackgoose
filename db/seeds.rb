# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  # Clients
  Client.create({username: "0", name:"Example Client", dob:"1992-01-13",
  line1: "94 Example Street", city: "Exampleton", state: "EX", zip:"00000",
  password: "12345789"})

  Client.create({username: "1", name:"Example Client", dob:"1992-01-13",
  line1: "94 Example Street", city: "Exampleton", state: "EX", zip:"00000",
  password: "12345789"})

  Client.create({username: "2", name:"Example Client", dob:"1992-01-13",
  line1: "94 Example Street", city: "Exampleton", state: "EX", zip:"00000",
  password: "12345789"})

  Client.create({username: "3", name:"Example Client", dob:"1992-01-13",
  line1: "94 Example Street", city: "Exampleton", state: "EX", zip:"00000",
  password: "12345789"})

  Client.create({username: "4", name:"Example Client", dob:"1992-01-13",
  line1: "94 Example Street", city: "Exampleton", state: "EX", zip:"00000",
  password: "12345789"})

  Client.create({username: "5", name:"Example Client", dob:"1992-01-13",
  line1: "94 Example Street", city: "Exampleton", state: "EX", zip:"00000",
  password: "12345789"})

  Client.create({username: "6", name:"Example Client", dob:"1992-01-13",
  line1: "94 Example Street", city: "Exampleton", state: "EX", zip:"00000",
  password: "12345789"})

  Client.create({username: "7", name:"Example Client", dob:"1992-01-13",
  line1: "94 Example Street", city: "Exampleton", state: "EX", zip:"00000",
  password: "12345789"})

  Client.create({username: "8", name:"Example Client", dob:"1992-01-13",
  line1: "94 Example Street", city: "Exampleton", state: "EX", zip:"00000",
  password: "12345789"})

  Client.create({username: "mbv", name:"Matthew Vasseur", dob:"1995-11-08",
    line1: "94 Van Dyke Road", city: "Princeton", state: "NJ", zip:"08540",
    password: "password1"})

  Client.create({username: "jjllama", name:"William Wright", dob:"1996-12-25",
    line1: "89 Meadowbrook Drive", city: "Princeton", state: "NJ", zip:"08540",
    password: "jjllama22"})

  # Escorts
  Escort.create({email: "kurt@marmar.is", username: "Example",
    name: "Example Girl", line1: "69 Example Lane", city: "Examplity",
    state: "EX", zip: "55569", dob:"1990-03-02", ethnicity:"White",
    height:"69", weight:"120", tit_size:"C", tit_type:"Natural", eyec:"Blue",
    hairc:"Blonde", password:"12345678", price:30000, online:true})

  Escort.create({email: "matt@marmar.is", name: "Hot Girl Escort",
    username: "HotGirl112", line1: "69 California Drive", city: "Las Vegas",
    state: "NV", zip: "04791", dob:"1990-09-14", ethnicity:"White",
    height:"68", weight:"115", tit_size:"C", tit_type:"Natural", eyec:"Blue",
    hairc:"Blonde", password:"12345678", price:20000})

  Escort.create({email: "mattvasseur@gmail.com", username: "PennCollegeGirl",
    name: "Penn College Girl", line1: "69 Penn Lane", city: "Philadelphia",
    state: "PA", zip: "53062", dob:"1991-03-02", ethnicity:"White",
    height:"64", weight:"110", tit_size:"B", tit_type:"Natural", eyec:"Brown",
    hairc:"Brown", password:"12345678", price:35000, online:true})

  Escort.create({email: "matthew.vasseur@yale.edu", username: "YourFantasy",
    name: "Your Fantasy", line1: "69 Fantasy Street", city: "Fantasia",
    state: "FA", zip: "00001", dob:"1990-12-02", ethnicity:"Black",
    height:"67", weight:"114", tit_size:"D", tit_type:"Fake", eyec:"Brown",
    hairc:"Black", password:"12345678", price:30000, online:true})

  Escort.create({email: "kurtmsk@gmail.com", username: "Generic Escort",
    name: "Generic Escort", line1: "69 Typical Road", city: "Genericity",
    state: "GE", zip: "12345", dob:"1990-09-09", ethnicity:"Asian",
    height:"63", weight:"100", tit_size:"DD", tit_type:"Natural", eyec:"Green",
    hairc:"Brown", password:"12345678", price:30000})

  Escort.create({email: "admin@marmar.is", username: "kurtmsk",
    name: "KKush Esscort", line1: "69 Typical Road", city: "Genericity",
    state: "GE", zip: "12345", dob:"1990-09-09", ethnicity:"White",
    height:"63", weight:"100", tit_size:"C", tit_type:"Natural", eyec:"Blue",
    hairc:"Blonde", password:"12345678", price:40000})

  Escort.create({email: "planetpluta@gmail.com", username: "marbv",
    name: "Mar BerVes", line1: "69 Typical Road", city: "Genericity",
    state: "GE", zip: "12345", dob:"1990-09-09", ethnicity:"White",
    height:"63", weight:"100", tit_size:"C", tit_type:"Natural", eyec:"Blue",
    hairc:"Blonde", password:"12345678", price:50000, online:true})

# intialize
Client.find_by_username("mbv").update(verified:true)

Escort.all.each do |e|
  e.update(verified: true)
end
