# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'

p 'Delete ancient seeds' # à classer du plus précis au moins

Carbonassessment.delete_all
Score.delete_all
UserAction.delete_all
Action.delete_all
User.delete_all

p 'Generate User seeds'
####################### USERS ###############################################################
user1 = User.create!({email: 'vincent.v@gmail.com',
                      password: '123456',
                      first_name: 'Vincent',
                      last_name: 'Vignali',
                      pseudo: 'Falkor',
                      rank_category: 'bronze',
                      transport_level: 'intermediate',
                      home_level: 'beginner',
                      numeric_level: 'beginner',
                      food_level: 'beginner'})
file1 = URI.open("https://media-exp1.licdn.com/dms/image/C4D03AQHPwMWR2XbSnQ/profile-displayphoto-shrink_800_800/0/1639410249022?e=1668038400&v=beta&t=2K79l1tLTlTGA4y0zMN-A7c1Ly6TujJWXR6AL2VY0CQ")
user1.photo.attach(io: file1, filename: "user1.jpg", content_type: "image/jpeg")

user2 = User.create!({email: 'jordan.jean@gmail.com',
                      password: '123456',
                      first_name: 'jordan',
                      last_name: 'jean',
                      pseudo: 'jjean971',
                      rank_category: 'bronze',
                      transport_level: 'intermediate',
                      home_level: 'beginner',
                      numeric_level: 'beginner',
                      food_level: 'beginner'})
file2 = URI.open("https://avatars.githubusercontent.com/u/108475328?v=4")
user2.photo.attach(io: file2, filename: "user2.jpg", content_type: "image/jpeg")

user3 = User.create!({email: 'rafa.icy@gmail.com',
                      password: '123456',
                      first_name: 'rafa',
                      last_name: 'delavega',
                      pseudo: 'icyaspasta',
                      rank_category: 'bronze',
                      transport_level: 'beginner',
                      home_level: 'beginner',
                      numeric_level: 'beginner',
                      food_level: 'beginner'})
file3 = URI.open("https://avatars.githubusercontent.com/u/107106167?v=4")
user3.photo.attach(io: file3, filename: "user3.jpg", content_type: "image/jpeg")


user4 = User.create!({email: 'lil.witch@gmail.com',
                      password: '123456',
                      first_name: 'sabrina',
                      last_name: 'theWitch',
                      pseudo: 'lilsabrina42',
                      rank_category: 'bronze',
                      transport_level: 'beginner',
                      home_level: 'beginner',
                      numeric_level: 'beginner',
                      food_level: 'beginner'})
file4 = URI.open("https://avatars.githubusercontent.com/u/107299884?v=4")
user4.photo.attach(io: file4, filename: "user4.jpg", content_type: "image/jpeg")

p 'Generate Action seeds'
####################### ACTIONS ###############################################################

# set d'action 1 (l1 = level 1 = difficulté, 1 lot d'action similaire
# avec 3 niveaux de difficulté (beginner, intermediate, advanced))
####################### TRANSPORT ###############################################################
action1l1 = Action.create({ title: 'Get your bike',
                            level: 'beginner',
                            score: '7',
                            category: 'transport',
                            description: "Get you bike instead of a car at least 1 time a week",
                            explication: "For a average distance of 10km you will also improve your health",
                            occurences: 1,
                            carbongain: 860_000 })
file1l1bike = URI.open("https://images.unsplash.com/photo-1593341476900-a1cfedc5c489?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1615&q=80")
action1l1.photo.attach(io: file1l1bike, filename: "bike1.jpg", content_type: "image/jpeg")

# Sur un an de trajet, à raison de 10 km par jour ouvré, un cycliste sur un vélo conventionnel émettra
# 224 kg de CO2 de moins qu’un automobiliste au volant d’un véhicule thermique,
# contre 223,5 kg de moins pour un utilisateur de bicyclette électrique.
# Les économies d’énergie seront donc quasiment les mêmes qu’on soit à vélo musculaire ou électrique.
action1l2 = Action.create({ title: 'Get your bike',
                            level: 'intermediate',
                            score: '15',
                            category: 'transport',
                            description: 'Get you bike instead of a car at least 2 times a week',
                            explication: 'For a average distance of 10km you will also improve your health more',
                            occurences: 1,
                            carbongain: 1_720_000 })
file1l2bike = URI.open("https://images.unsplash.com/photo-1505705694340-019e1e335916?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2832&q=80")
action1l2.photo.attach(io: file1l2bike, filename: "bike2.jpg", content_type: "image/jpeg")

action1l3 = Action.create({ title: 'Get your bike',
                            level: 'advanced',
                            score: '35',
                            category: 'transport',
                            description: 'Get you bike instead of a car at least 5 times a week',
                            explication: 'For a average distance of 10km you will also improve your
                                          health more and more and become an athlete',
                            occurences: 1,
                            carbongain: 4_300_000 })
file1l3bike = URI.open("https://images.unsplash.com/photo-1528629297340-d1d466945dc5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2122&q=80")
action1l3.photo.attach(io: file1l3bike, filename: "bike3.jpg", content_type: "image/jpeg")

# train vs flight
action2l1 = Action.create({ title: 'Take train VS flight',
                            level: 'beginner',
                            score: '7',
                            category: 'transport',
                            description: 'Take the intercity train instead of a domestic flight',
                            explication:'You will decrease your carbon impact by 28 times, a travel of 300km
                                          with an intercity train will generate 2,2 kgCO2e/p whereas 62,1 kgCO2e/p
                                          for a domestic flight',
                            occurences: 1,
                            carbongain: 59_900_000 })
file2l1train = URI.open("https://images.unsplash.com/photo-1527295110-5145f6b148d0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1731&q=80")
action2l1.photo.attach(io: file2l1train, filename: "train-intercity.jpg", content_type: "image/jpeg")

action2l2 = Action.create({ title: 'Take train VS flight',
                            level: 'intermediate',
                            score: '15',
                            category: 'transport',
                            description: 'Take the train instead of a domestic flight',
                            explication: 'For example with Paris-Toulouse,
                                          you will decrease your carbon impact by 56 times, a travel of 800km
                                          with a train will generate 1,4 kgCO2e/p whereas 79 kgCO2e/p
                                          for a domestic flight',
                            occurences: 1,
                            carbongain: 77_600_000 })
file2l2train = URI.open("https://images.unsplash.com/photo-1515165562839-978bbcf18277?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80")
action2l2.photo.attach(io: file2l2train, filename: "train2.jpg", content_type: "image/jpeg")

action2l3 = Action.create({ title: 'Sailing boat VS flight',
                            level: 'advanced',
                            score: '35',
                            category: 'transport',
                            description: 'If you have time, take a sailing boat',
                            explication: 'Taking a sailing boat instead of
                                          a long-haul flight for a Paris New-York (11 700km)
                                          you will decrease your carbon impact near infinite',
                            occurences: 1,
                            carbongain: 1_178_000_000 })
file2l3boat = URI.open("https://images.unsplash.com/photo-1597236962720-2688febea843?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=654&q=80")
action2l3.photo.attach(io: file2l3boat, filename: "sailingboat.jpg", content_type: "image/jpeg")

action3l1 = Action.create({ title: 'Bus is your friend',
                            level: 'beginner',
                            score: '7',
                            category: 'transport',
                            description: 'Take the bus at least one time a week',
                            explication: 'For a trip in bus with a average of 20 people you will generate 50gCO2e/km so 0,50kgCO2e
                            for 10km. An efficient car or a little car generate 156gCO2e/km
                            if there is only one person. So take the bus will decrease your carbon impact by 28 times',
                            occurences: 1,
                            carbongain: 1_060_000 })
file3l1bus = URI.open("https://images.unsplash.com/photo-1632276536839-84cad7fd03b0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1064&q=80")
action3l1.photo.attach(io: file3l1bus, filename: "bus1.jpg", content_type: "image/jpeg")
# bus 68gCO2e/km (12,7person) approx=> 50gCO2/km (20p) => 0,50kgCO2 for 10km
# Efficient car or little car 104gC02/km (1,5person) => 156gCO2/km (1p) => 1,56kgCO2  for 10km
action3l2 = Action.create({ title: 'Bus is your friend',
                            level: 'intermediate',
                            score: '15',
                            category: 'transport',
                            description: 'Take the bus at least 3 times a week',
                            explication: 'or a trip in bus with a average of 20 people you will generate
                            50gCO2e/km so 0,50kgCO2e for 10km. An efficient car or a little car generate 156gCO2e/km
                            if there is only one person. So take the bus will decrease your carbon impact by 28 times',
                            occurences: 1,
                            carbongain: 3_180_000 })
file3l2bus = URI.open("https://images.unsplash.com/photo-1562620669-98104534c6cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80")
action3l2.photo.attach(io: file3l2bus, filename: "bus2.jpg", content_type: "image/jpeg")
# bus: 0,50kgCO2 for 10km => 1,5kgCO2 for 3 times (30km)
# car: 1,56kgCO2  for 10km => 4,68kgCO2 for 3 times (30km)
action3l3 = Action.create({ title: 'Bus is your friend',
                            level: 'advanced',
                            score: '35',
                            category: 'transport',
                            description: 'Take the bus at least 5 times a week',
                            explication: 'For a trip in bus with a average of 20 people you will generate 50gCO2e/km
                            so 0,50kgCO2e for 10km. An efficient car or a little car generate 156gCO2e/km
                            if there is only one person. So take the bus will decrease your carbon impact by 28 times',
                            occurences: 1,
                            carbongain: 5_300_000 })
file3l3bus = URI.open("https://images.unsplash.com/photo-1597920467799-ec8bee99f6eb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=680&q=80")
action3l3.photo.attach(io: file3l3bus, filename: "bus3.jpg", content_type: "image/jpeg")
# bus: 0,50kgCO2 for 10km => 2,5kgCO2 for 5 times (50km)
# car: 1,56kgCO2  for 10km => 7,8kgCO2 for 5 times (50km)

####################### FOOD ###############################################################
action4l1 = Action.create({ title: 'White meat VS Red meat',
                            level: 'beginner',
                            score: '7',
                            category: 'food',
                            description: 'Replace red meat by fish or white meat 1 time per week',
                            explication: "It's generate 40 kgCO2e/kg of red meat
                                          instead of white meat or fish that generate 9,5 kgCO2e/kg,
                                          it also increase methane in atmosphere",
                            occurences: 1,
                            carbongain: 3_050_000 })
file4l1redmeat = URI.open("https://images.unsplash.com/photo-1532550907401-a500c9a57435?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1769&q=80")
action4l1.photo.attach(io: file4l1redmeat, filename: "redmeat.jpg", content_type: "image/jpeg")

# 100g red meat => 4kgCO2e
# 100g white meat => 0,95kgC02e
action4l2 = Action.create({ title: 'Eggs vs Red meat',
                            level: 'intermediate',
                            score: '15',
                            category: 'food',
                            description: 'Replace red meat by eggs 2 times a week',
                            explication: "It's generate 40 kgCO2e/kg of red meat
                            instead of eggs that generate 2,8 kgCO2e/kg",
                            occurences: 1,
                            carbongain: 7_480_000 })
file4l2redmeat = URI.open("https://images.unsplash.com/photo-1585507252242-11fe632c26e8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80")
action4l2.photo.attach(io: file4l2redmeat, filename: "redmeat2.jpg", content_type: "image/jpeg")
# 2*100g red meat => 8kgCO2e
# 2*100g eggs => 0,52kgCO2e

action4l3 = Action.create({ title: 'Vegetarian VS Red meat',
                            level: 'advanced',
                            score: '35',
                            category: 'food',
                            description: 'Get 5 times a week vegetarian meals',
                            explication: "That generate 40 kgCO2e/kg of red meat by
                            a melt of oleaginous that generate 4 kgCO2e/kg,
                            starches (2kgCO2e/kg) and legumes (0,5kgCO2e/kg)",
                            occurences: 1,
                            carbongain: 18_915_000 })
file4l3redmeat = URI.open("https://images.unsplash.com/photo-1598449426314-8b02525e8733?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1626&q=80")
action4l3.photo.attach(io: file4l3redmeat, filename: "redmeat3.jpg", content_type: "image/jpeg")
# 5*100g red meat => 20 kgCO2e
# 5*100g mixed((1/3)*(4+2+0.5)) =>  1,085kgCO2e
# 2,17 kgCO2e/k => 5 * 0,217

actionwastefood = Action.create({ title: 'Reduce food waste',
                                  level: 'beginner',
                                  score: '7',
                                  category: 'food',
                                  description: 'Avoid to generate food waste',
                                  explication: "According to ADEME, nearly 10 million tonnes of consumable food are
                                                thrown away each year in France.And it is estimated that food waste
                                                emits more greenhouse gases than a country like India
                                                (4th biggest polluter in the world).",
                                  occurences: 1,
                                  carbongain: 0 })
filewastefood = URI.open("https://images.unsplash.com/photo-1605027538782-c1b60ffa6cef?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80")
actionwastefood.photo.attach(io: filewastefood, filename: "wastefood.jpg", content_type: "image/jpeg")

actionwastefood = Action.create({ title: 'Favor Local produce',
                                  level: 'beginner',
                                  score: '7',
                                  category: 'food',
                                  description: 'Favor short circuits and seasonal products',
                                  explication: "Eating imported fruits or vegetables generates
                                                an oil consumption 10 to 20 times higher than the consumption of local fruits or vegetables.
                                                So Favor short circuits (stores close to your home)",
                                  occurences: 1,
                                  carbongain: 0 })
filewastefood = URI.open("https://images.unsplash.com/photo-1506484381205-f7945653044d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80")
actionwastefood.photo.attach(io: filewastefood, filename: "wastefood.jpg", content_type: "image/jpeg")
####################### DIGITAL ###############################################################

action5l1multiscreen = Action.create({ title: 'Adapt your video resolution to the screen',
                                        level: 'beginner',
                                        score: '7',
                                        category: 'numeric',
                                        description: 'Choose résolution between 360p and 720p',
                                        explication: "For example, for a 13-inch screen, a resolution of 360 to 720 inches is
                                                      sufficient when watching a streaming video.
                                                      Watching online videos generated more than 300 megatons of CO2 in 2018.
                                                      Which corresponds to a country like Spain. (ADEME)",
                                        occurences: 1,
                                        carbongain: 0 })
file5l1multiscreen = URI.open("https://images.unsplash.com/photo-1588508065123-287b28e013da?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80")
action5l1multiscreen.photo.attach(io: file5l1multiscreen, filename: 'multiscreen.jpg', content_type: 'image/jpeg')

action6l1stream = Action.create({ title: 'Stop streaming autoplay',
                                  level: 'beginner',
                                  score: '7',
                                  category: 'numeric',
                                  description: 'Disable video autoplay',
                                  explication: 'Most of social networks and streaming platforms have an autoplay.
                                                You will save energy time and choose what you want to watch',
                                  occurences: 1,
                                  carbongain: 0 })
file6l1stream = URI.open('https://images.unsplash.com/photo-1611162616475-46b635cb6868?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1674&q=80')
action6l1stream.photo.attach(io: file6l1stream, filename: 'stopautoplay.jpg', content_type: 'image/jpeg')

action7l1email = Action.create({ title: 'Better email management',
                                level: 'beginner',
                                score: '7',
                                category: 'numeric',
                                description: 'Regularly sort your mailbox',
                                explication: 'Delete sent messages, spam, junk mail. And empty your trash,
                                              to avoid storing these useless emails in data centers.
                                              For example, a French person receives an average of 936 newsletters per year,
                                              (9 kgCO2e if we take into account their energy-intensive sending and storage).',
                                occurences: 1,
                                carbongain: 0 })
file7l1email = URI.open('https://images.unsplash.com/photo-1643845892686-30c241c3938c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=776&q=80')
action7l1email.photo.attach(io: file7l1email, filename: 'notifemail.jpg', content_type: 'image/jpeg')

####################### HOUSEHOLD ###############################################################


p 'Generate User_Action seeds'
####################### USER-ACTIONS ###############################################################

# 3 transport actions begginer validate by user 1

user1_action1 = UserAction.create({ title: action1l1.title,
                                    status: 'validated',
                                    user_occurences: 1,
                                    user_id: user1.id,
                                    action_id: action1l1.id,
                                    score: action1l1.score,
                                    category: action1l1.category,
                                    carbongain: action1l1.carbongain })

user1_action2 = UserAction.create({ title: action2l1.title,
                                    status: 'validated',
                                    user_occurences: 1,
                                    user_id: user1.id,
                                    action_id: action2l1.id,
                                    score: action2l1.score,
                                    category: action2l1.category,
                                    carbongain: action2l1.carbongain })

user1_action3 = UserAction.create({ title: action3l1.title,
                                    status: 'validated',
                                    user_occurences: 1,
                                    user_id: user1.id,
                                    action_id: action3l1.id,
                                    score: action3l1.score,
                                    category: action3l1.category,
                                    carbongain: action3l1.carbongain })

# that permit him to unlock silver rank
# and intermediate actions in transport category

user1_action4 = UserAction.create({ title: action1l2.title,
                                    status: 'selected',
                                    user_occurences: 0,
                                    user_id: user1.id,
                                    action_id: action1l2.id,
                                    score: action1l2.score,
                                    category: action1l2.category,
                                    carbongain: action1l2.carbongain })

user1_action5 = UserAction.create({ title: action2l2.title,
                                    status: 'selected',
                                    user_occurences: 0,
                                    user_id: user1.id,
                                    action_id: action2l2.id,
                                    score: action2l2.score,
                                    category: action2l2.category,
                                    carbongain: action2l2.carbongain })

# user1_action6 = UserAction.create({ title: action3l2.title,
#                                     status: 'selected',
#                                     user_occurences: 0,
#                                     user_id: user1.id,
#                                     action_id: action3l2.id,
#                                     score: action3l2.score,
#                                     category: action3l2.category,
#                                     carbongain: action3l2.carbongain })

# for the list of all his view we will attribute him an action from food category

user1_action7 = UserAction.create({ title: action4l1.title,
                                    status: 'validated',
                                    user_occurences: 1,
                                    user_id: user1.id,
                                    action_id: action4l1.id,
                                    score: action4l1.score,
                                    category: action4l1.category,
                                    carbongain: action4l1.carbongain })

user1_action8 = UserAction.create({ title: actionwastefood.title,
                                    status: 'selected',
                                    user_occurences: 0,
                                    user_id: user1.id,
                                    action_id: actionwastefood.id,
                                    score: actionwastefood.score,
                                    category: actionwastefood.category,
                                    carbongain: actionwastefood.carbongain })

p 'Generate score for vincent'
# score1 = Score.create({ user_id: user1,
#                         transport_score: 21,
#                         food_score: 7,
#                         digital_score: 0,
#                         household_score: 0,
#                         total_score: 28 })

score_user1 = user1.score

score_user1.transport_score = 21
score_user1.food_score = 14
score_user1.digital_score = 0
score_user1.household_score = 0
score_user1.total_score = 35
score_user1.save

p 'Finished seeds'
