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
                        rank_category: 'bronze',
                        transport_level: 'beginner',
                        home_level: 'beginner',
                        numeric_level: 'beginner',
                        food_level: 'beginner'
                     })
file1 = URI.open("https://avatars.githubusercontent.com/u/86103386?v=4")
user1.photo.attach(io: file1, filename: "user1.jpg", content_type: "image/jpeg")


user2 = User.create!({
  email: 'jordan.jean@gmail.com',
  password: '123456',
  first_name: 'jordan',
  last_name: 'jean',
  pseudo: 'jjean971',
  rank_category: 'bronze',
  transport_level: 'intermediate',
  home_level: 'beginner',
  numeric_level: 'beginner',
  food_level: 'beginner'
})
file2 = URI.open("https://avatars.githubusercontent.com/u/108475328?v=4")
user2.photo.attach(io: file2, filename: "user2.jpg", content_type: "image/jpeg")



user3 = User.create!({
  email: 'rafa.icy@gmail.com',
  password: '123456',
  first_name: 'rafa',
  last_name: 'delavega',
  pseudo: 'icyaspasta',
  rank_category: 'bronze',
  transport_level: 'beginner',
  home_level: 'beginner',
  numeric_level: 'beginner',
  food_level: 'beginner'
})
file3 = URI.open("https://avatars.githubusercontent.com/u/107106167?v=4")
user3.photo.attach(io: file3, filename: "user3.jpg", content_type: "image/jpeg")


user4 = User.create!({
  email: 'lil.witch@gmail.com',
  password: '123456',
  first_name: 'sabrina',
  last_name: 'theWitch',
  pseudo: 'lilsabrina42',
  rank_category: 'bronze',
  transport_level: 'beginner',
  home_level: 'beginner',
  numeric_level: 'beginner',
  food_level: 'beginner'
})
file4 = URI.open("https://avatars.githubusercontent.com/u/107299884?v=4")
user4.photo.attach(io: file4, filename: "user4.jpg", content_type: "image/jpeg")

p 'Generate Action seeds'
####################### ACTIONS ###############################################################

# set d'action 1 (l1 = level 1 = difficulté, 1 lot d'action similaire
# avec 3 niveaux de difficulté (beginner, intermediate, advanced))
action1l1 = Action.create({ title: 'Get your bike',
                            level: 'beginner',
                            score: '7',
                            category: 'transport',
                            description: "Get you bike instead of a car at least 1 time a week, for a average distance
                                          of 10km you will also improve your health",
                            occurences: 1,
                            carbongain: 860_000 })
# Sur un an de trajet, à raison de 10 km par jour ouvré, un cycliste sur un vélo conventionnel émettra
# 224 kg de CO2 de moins qu’un automobiliste au volant d’un véhicule thermique,
# contre 223,5 kg de moins pour un utilisateur de bicyclette électrique.
# Les économies d’énergie seront donc quasiment les mêmes qu’on soit à vélo musculaire ou électrique.
action1l2 = Action.create({ title: 'Get your bike',
                            level: 'intermediate',
                            score: '15',
                            category: 'transport',
                            description: "Get you bike instead of a car at least 2 times a week, for a average distance
                                          of 10km you will also improve your health more",
                            occurences: 1,
                            carbongain: 1_720_000 })
action1l3 = Action.create({ title: 'Get your bike',
                            level: 'advanced',
                            score: '35',
                            category: 'transport',
                            description: "Get you bike instead of a car at least 5 times a week, for a average distance
                                          of 10km you will also improve your health more and more and become an athlete",
                            occurences: 1,
                            carbongain: 4_300_000 })
action2l1 = Action.create({ title: 'Take train VS domestic flight',
                            level: 'beginner',
                            score: '7',
                            category: 'transport',
                            description: "Take the intercity train instead of a domestic flight,
                                          you will decrease your carbon impact by 28 times, a travel of 300km
                                          with an intercity train will generate 2,2 kgCO2e/p whereas 62,1 kgCO2e/p
                                          for a domestic flight",
                            occurences: 1,
                            carbongain: 59_900_000 })
action2l2 = Action.create({ title: 'Take train VS domestic flight',
                            level: 'intermediate',
                            score: '15',
                            category: 'transport',
                            description: "Take the train instead of a domestic flight, for example with Paris-Toulouse,
                                          you will decrease your carbon impact by 56 times, a travel of 800km
                                          with a train will generate 1,4 kgCO2e/p whereas 79 kgCO2e/p
                                          for a domestic flight",
                            occurences: 1,
                            carbongain: 77_600_000 })

action2l3 = Action.create({ title: 'Take the sailing boat VS long-haul flight',
                            level: 'advanced',
                            score: '1000',
                            category: 'transport',
                            description: "If you have time, take a sailing boat instead of
                            a long-haul flight for a Paris New-York (11 700km)
                            you will decrease your carbon impact near infinite",
                            occurences: 1,
                            carbongain: 1_178_000_000 })
action3l1 = Action.create({ title: 'Bus is your friend',
                            level: 'beginner',
                            score: '7',
                            category: 'transport',
                            description: "Take the bus at least one time a week
                            for a trip in bus with a average of 20 people you will generate 50gCO2e/km so 0,50kgCO2e
                            for 10km. An efficient car or a little car generate 156gCO2e/km
                            if there is only one person. So take the bus will decrease your carbon impact by 28 times",
                            occurences: 1,
                            carbongain: 1_060_000 })
# bus 68gCO2e/km (12,7person) approx=> 50gCO2/km (20p) => 0,50kgCO2 for 10km
# Efficient car or little car 104gC02/km (1,5person) => 156gCO2/km (1p) => 1,56kgCO2  for 10km
action3l2 = Action.create({ title: 'Bus is your friend',
                            level: 'intermediate',
                            score: '15',
                            category: 'transport',
                            description: "Take the bus at least 3 times a week
                            for a trip in bus with a average of 20 people you will generate 50gCO2e/km so 0,50kgCO2e
                            for 10km. An efficient car or a little car generate 156gCO2e/km
                            if there is only one person. So take the bus will decrease your carbon impact by 28 times",
                            occurences: 1,
                            carbongain: 3_180_000 })
# bus: 0,50kgCO2 for 10km => 1,5kgCO2 for 3 times (30km)
# car: 1,56kgCO2  for 10km => 4,68kgCO2 for 3 times (30km)
action3l3 = Action.create({ title: 'Bus is your friend',
                            level: 'advanced',
                            score: '35',
                            category: 'transport',
                            description: "Take the bus at least 5 times a week
                            for a trip in bus with a average of 20 people you will generate 50gCO2e/km so 0,50kgCO2e
                            for 10km. An efficient car or a little car generate 156gCO2e/km
                            if there is only one person. So take the bus will decrease your carbon impact by 28 times",
                            occurences: 1,
                            carbongain: 5_300_000 })
# bus: 0,50kgCO2 for 10km => 2,5kgCO2 for 5 times (50km)
# car: 1,56kgCO2  for 10km => 7,8kgCO2 for 5 times (50km)
action4l1 = Action.create({ title: 'Red Meat',
                            level: 'beginner',
                            score: '7',
                            category: 'food',
                            description: "Replace red meat 1 time per week. It's generate 40 kgCO2e/kg of red meat
                                          instead of white meat or fish that generate 9,5 kgCO2e/kg,
                                          it also increase methane in atmosphere",
                            occurences: 1,
                            carbongain: 3_050_000 })
# 100g red meat => 4kgCO2e
# 100g white meat => 0,95kgC02e
action4l2 = Action.create({ title: 'Red Meat',
                            level: 'intermediate',
                            score: '10',
                            category: 'food',
                            description: "Replace red meat 2 times a week. It's generate 40 kgCO2e/kg of red meat
                            instead of eggs that generate 2,8 kgCO2e/kg",
                            occurences: 1,
                            carbongain: 7_480_000 })
# 2*100g red meat => 8kgCO2e
# 2*100g eggs => 0,52kgCO2e

action4l3 = Action.create({ title: 'Red Meat',
                            level: 'advanced',
                            score: '15',
                            category: 'food',
                            description: "Replace red meat 5 times a week that generate 40 kgCO2e/kg of red meat by
                            a melt of oleaginous that generate 4 kgCO2e/kg,
                            starches (2kgCO2e/kg) and legumes (0,5kgCO2e/kg)",
                            occurences: 1,
                            carbongain: 18_915_000 })
# 5*100g red meat => 20 kgCO2e
# 5*100g mixed((1/3)*(4+2+0.5)) =>  1,085kgCO2e
# 2,17 kgCO2e/k => 5 * 0,217

# action2 = Action.create({ title: 'household question', level: 'beginner', score: '7', category: 'household', description: "do some stuff for the planet", occurences: 1 })
# action3 = Action.create({ title: 'numeric question', level: 'beginner', score: '7', category: 'digital', description: "do some stuff for the planet", occurences: 1 })
# action4 = Action.create({ title: 'food question', level: 'beginner', score: '7', category: 'food', description: "do some stuff for the planet", occurences: 1 })

p 'Generate User_Action seeds'
####################### USER-ACTIONS ###############################################################

# 3 transport actions begginer validate by user 1

user1_action1 = UserAction.create({ title: action1l1.title,
                                    status: 'validated',
                                    user_occurences: 1,
                                    user_id: user1.id,
                                    action_id: action1l1.id,
                                    score: action1l1.score,
                                    category: action1l1.category })

user1_action2 = UserAction.create({ title: action2l1.title,
                                    status: 'validated',
                                    user_occurences: 1,
                                    user_id: user1.id,
                                    action_id: action2l1.id,
                                    score: action2l1.score,
                                    category: action2l1.category })

user1_action3 = UserAction.create({ title: action3l1.title,
                                    status: 'validated',
                                    user_occurences: 1,
                                    user_id: user1.id,
                                    action_id: action3l1.id,
                                    score: action3l1.score,
                                    category: action3l1.category })

# that permit him to unlock silver rank
# and intermediate actions in transport category

user1_action4 = UserAction.create({ title: action1l2.title,
                                    status: 'selected',
                                    user_occurences: 0,
                                    user_id: user1.id,
                                    action_id: action1l2.id,
                                    score: action1l2.score,
                                    category: action1l2.category })

user1_action5 = UserAction.create({ title: action2l2.title,
                                    status: 'selected',
                                    user_occurences: 0,
                                    user_id: user1.id,
                                    action_id: action2l2.id,
                                    score: action2l2.score,
                                    category: action2l2.category })

user1_action6 = UserAction.create({ title: action2l2.title,
                                    status: 'selected',
                                    user_occurences: 0,
                                    user_id: user1.id,
                                    action_id: action2l2.id,
                                    score: action2l2.score,
                                    category: action2l2.category })

# for the list of all his view we will attribute him an action from food category

user1_action7 = UserAction.create({ title: action4l1.title,
                                    status: 'validated',
                                    user_occurences: 0,
                                    user_id: user1.id,
                                    action_id: action4l1.id,
                                    score: action4l1.score,
                                    category: action4l1.category })

user1_action8 = UserAction.create({ title: action4l2.title,
                                    status: 'selected',
                                    user_occurences: 0,
                                    user_id: user1.id,
                                    action_id: action4l2.id,
                                    score: action4l2.score,
                                    category: action4l2.category })
