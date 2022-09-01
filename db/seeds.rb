# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'

p 'Delete ancient seeds' # à classer du plus précis au moins

UserAction.delete_all
Action.delete_all
User.delete_all

p 'Generate User seeds'
####################### USERS ###############################################################
user1 = User.create!({
                        email: 'jean.jordan@gmail.com',
                        password: '123456',
                        first_name: 'jean',
                        last_name: 'jordan',
                        pseudo: 'jjordan47',
                        rank_category: 'iron',
                        transport_level: 'neophyte',
                        home_level: 'neophyte',
                        numeric_level: 'neophyte',
                        food_level: 'neophyte'
                     })
file1 = URI.open("https://avatars.githubusercontent.com/u/86103386?v=4")
user1.photo.attach(io: file1, filename: "user1.jpg", content_type: "image/jpeg")


user2 = User.create!({
  email: 'jordan.jean@gmail.com',
  password: '123456',
  first_name: 'jordan',
  last_name: 'jean',
  pseudo: 'jjean971',
  rank_category: 'iron',
  transport_level: 'neophyte',
  home_level: 'neophyte',
  numeric_level: 'neophyte',
  food_level: 'neophyte'
})
file2 = URI.open("https://avatars.githubusercontent.com/u/108475328?v=4")
user2.photo.attach(io: file2, filename: "user2.jpg", content_type: "image/jpeg")



user3 = User.create!({
  email: 'rafa.icy@gmail.com',
  password: '123456',
  first_name: 'rafa',
  last_name: 'delavega',
  pseudo: 'icyaspasta',
  rank_category: 'iron',
  transport_level: 'neophyte',
  home_level: 'neophyte',
  numeric_level: 'neophyte',
  food_level: 'neophyte'
})
file3 = URI.open("https://avatars.githubusercontent.com/u/107106167?v=4")
user3.photo.attach(io: file3, filename: "user3.jpg", content_type: "image/jpeg")


user4 = User.create!({
  email: 'lil.witch@gmail.com',
  password: '123456',
  first_name: 'sabrina',
  last_name: 'theWitch',
  pseudo: 'lilsabrina42',
  rank_category: 'iron',
  transport_level: 'neophyte',
  home_level: 'neophyte',
  numeric_level: 'neophyte',
  food_level: 'neophyte'
})
file4 = URI.open("https://avatars.githubusercontent.com/u/107299884?v=4")
user4.photo.attach(io: file4, filename: "user4.jpg", content_type: "image/jpeg")


p 'Generate Action seeds'
#######################    ACTIONS ###############################################################

# set d'action 1 (l1 = level 1 = difficulté, 1 lot d'action similaire
# avec 3 niveaux de difficulté (beginner, intermediate, advanced))
action1l1 = Action.create({ title: 'Get your bike',
                            level: 'beginner',
                            score: '7',
                            category: 'transport',
                            description: "Get you bike at least 1 time a week, for a average distance of 10km",
                            occurences: 1 ,
                            carbongain: 860_000 })

action1l2 = Action.create({ title: 'Get your bike',
                            level: 'intermediate',
                            score: '10',
                            category: 'transport',
                            description: "Get you bike at least 2 times a week, for a average distance of 10km ",
                            occurences: 1,
                            carbongain: 1_720_000 })

action1l3 = Action.create({ title: 'Get your bike',
                            level: 'advanced',
                            score: '15',
                            category: 'transport',
                            description: "Get you bike at least 5 times a week, for a average distance of 10km",
                            occurences: 1,
                            carbongain: 4_300_000 })

action2l1 = Action.create({ title: 'Take train VS domestic flight (300km)',
                            level: 'beginner',
                            score: '7',
                            category: 'transport',
                            description: "Take the intercity train instead of a domestic flight,
                                          you will decrease your carbon impact by 28 times, a travel of 300km
                                          with an intercity train will generate 2,2kg.CO2/p whereas 62,1kg.CO2/p
                                          for a domestic flight",
                            occurences: 1 ,
                            carbongain: 59_900_000 })

action2l2 = Action.create({ title: 'Take train VS domestic flight (800km)',
                            level: 'intermediate',
                            score: '10',
                            category: 'transport',
                            description: "Take the train instead of a domestic flight, for example with Paris-Toulouse,
                                          you will decrease your carbon impact by 56 times, a travel of 800km
                                          with a train will generate 1,4kg.CO2/p whereas 79kg.CO2/p
                                          for a domestic flight",
                            occurences: 1,
                            carbongain: 77_600_000 })

action2l3 = Action.create({ title: 'Take the sailing boat VS long-haul flight (11 700km)',
                            level: 'advanced',
                            score: '15',
                            category: 'transport',
                            description: "If you have time, take a sailing boat instead of
                            a long-haul flight for a Paris New-York you will decrease your carbon impact near infinite",
                            occurences: 1,
                            carbongain: 1_178_000_000 })

  # Sur un an de trajet, à raison de 10 km par jour ouvré, un cycliste sur un vélo conventionnel émettra
  # 224 kg de CO2 de moins qu’un automobiliste au volant d’un véhicule thermique,
  # contre 223,5 kg de moins pour un utilisateur de bicyclette électrique.
  # Les économies d’énergie seront donc quasiment les mêmes qu’on soit à vélo musculaire ou électrique.

# action3l1 = Action.create({ title: '',
#                             level: 'beginner',
#                             score: '7',
#                             category: 'transport',
#                             description: "Take the intercity train instead of a domestic flight,
#                                           you will decrease your carbon impact by 28 times, a travel of 300km
#                                           with an intercity train will generate 2,2kg.CO2/p whereas 62,1kg.CO2/p
#                                           for a domestic flight",
#                             occurences: 1 ,
#                             carbongain: 59_900_000 })

# action3l2 = Action.create({ title: '',
#                             level: 'intermediate',
#                             score: '10',
#                             category: 'transport',
#                             description: "Take the train instead of a domestic flight, for example with Paris-Toulouse,
#                                           you will decrease your carbon impact by 56 times, a travel of 800km
#                                           with a train will generate 1,4kg.CO2/p whereas 79kg.CO2/p
#                                           for a domestic flight",
#                             occurences: 1,
#                             carbongain: 77_600_000 })

# action3l3 = Action.create({ title: '',
#                             level: 'advanced',
#                             score: '15',
#                             category: 'transport',
#                             description: "If you have time, take a sailing boat instead of
#                             a long-haul flight for a Paris New-York you will decrease your carbon impact near infinite",
#                             occurences: 1,
#                             carbongain: 1_178_000_000 })




  action2 = Action.create({ title: 'household question', level: 'beginner', score: '7', category: 'household', description: "do some stuff for the planet", occurences: 1 })

  action3 = Action.create({ title: 'numeric question', level: 'beginner', score: '7', category: 'digital', description: "do some stuff for the planet", occurences: 1 })

  action4 = Action.create({ title: 'food question', level: 'beginner', score: '7', category: 'food', description: "do some stuff for the planet", occurences: 1 })


#######################    USER-ACTIONS ###############################################################


  # user_action1 = UserAction.create({
  #                                     title: 'transport question',
  #                                     status: 'unvalidated',
  #                                     user_occurences: 0,
  #                                     user_id: user1.id,
  #                                     action_id: action1.id,
  #                                     score: action1.score,
  #                                     category: action1.category
  #                                   })

  user_action2 = UserAction.create({
                                      title: 'household question',
                                      status: 'unvalidated',
                                      user_occurences: 0,
                                      user_id: user1.id,
                                      action_id: action2.id,
                                      score: action2.score,
                                      category: action2.category })

  user_action3 = UserAction.create({
                                      title: 'digital question',
                                      status: 'unvalidated',
                                      user_occurences: 0,
                                      user_id: user1.id,
                                      action_id: action3.id,
                                      score: action3.score,
                                      category: action3.category })

  user_action4 = UserAction.create({
                                      title: 'food question',
                                      status: 'unvalidated',
                                      user_occurences: 0,
                                      user_id: user1.id,
                                      action_id: action4.id,
                                      score: action4.score,
                                      category: action4.category })
