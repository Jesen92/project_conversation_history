# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(first_name: 'Luke', last_name: 'Skywalker', email: 'luke.skywalker@republic.com', password: 'jedi123',
            password_confirmation: 'jedi123')
User.create(first_name: 'Anakin', last_name: 'Skywalker', email: 'anakin.skywalker@empire.com', password: 'sith123',
            password_confirmation: 'sith123')
