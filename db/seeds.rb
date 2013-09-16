# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# AudienceType :
# Public, Organization, Team, Only Me, Custom

# Context:
# Global, [dynamic]
Context.create(name: Settings['context.global.name'])

# OrganizationCategory:
# Project, Product, Offsite
OrganizationCategory.create(name: 'Welfare', image_url: 'https://s3.amazonaws.com/GoodAroundMe/categories/categories_walefare_01.jpg')
OrganizationCategory.create(name: 'Animals', image_url: 'https://s3.amazonaws.com/GoodAroundMe/categories/categories_animals_01.jpg')
OrganizationCategory.create(name: 'Environment', image_url: 'https://s3.amazonaws.com/GoodAroundMe/categories/categories_environment_01.jpg')
OrganizationCategory.create(name: 'Health', image_url:'https://s3.amazonaws.com/GoodAroundMe/categories/categories_health.jpg')
OrganizationCategory.create(name: 'Peace & Coexistence', image_url: 'https://s3.amazonaws.com/GoodAroundMe/categories/categories_peace_01.jpg')
OrganizationCategory.create(name: 'Children', image_url: 'https://s3.amazonaws.com/GoodAroundMe/categories/categories_children_01.jpg')

# GroupType
# Organization, Team
GroupType.create(name: 'Organization')

# Domain
# whitelist

# blacklist
#Domain.create(name: 'gmail.com',  blacklist: true)