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
OrganizationCategory.create(name: 'Welfare')
OrganizationCategory.create(name: 'Animals')
OrganizationCategory.create(name: 'Environment')

# GroupType
# Organization, Team
GroupType.create(name: 'Organization')

# Organization & Domain
# whitelist

# blacklist
#Domain.create(name: 'gmail.com',  blacklist: true)