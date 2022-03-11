# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

RequestType.find_or_create_by(description: 'Training')
RequestType.find_or_create_by(description: 'New Device')
RequestType.find_or_create_by(description: 'Device Repair')
RequestType.find_or_create_by(description: 'Check-in Call')
RequestType.find_or_create_by(description: 'Other')

RequestStatus.find_or_create_by(description: 'Unassigned')
RequestStatus.find_or_create_by(description: 'Unstarted')
RequestStatus.find_or_create_by(description: 'In Progress')
RequestStatus.find_or_create_by(description: 'Resolved')
