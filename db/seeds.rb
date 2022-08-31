# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
UserAction.delete_all
Action.delete_all
User.delete_all

#######################    USERS ###############################################################
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



#######################    ACTIONS ###############################################################


  action1 = Action.create({ title: 'transport question', level: 'beginner', score: '7', category: 'transport', description: "do some stuff for the planet", occurences: 1 })

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
