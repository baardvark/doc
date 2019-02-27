roles = ['physician', 'nurse', 'patient']
10.times do
  doctor = Doctor.create(
    name: Faker::TvShows::RickAndMorty.character
  )
 
  10.times do 
    user = User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
    )

    Appointment.create(
      role: roles.sample,
      doctor_id: doctor.id,
      user_id: user.id
    )
  end
end

puts "Data Seeded."

