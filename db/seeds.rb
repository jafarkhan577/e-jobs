require 'faker'

# Development മോഡ് ആയാൽ മാത്രമേ ഡാറ്റ ക്ലിയർ ചെയ്യൂ.
if Rails.env.development?
  Job.delete_all
  Company.delete_all
  User.delete_all
end

# ഡിഫോൾട്ട് യൂസർ സൃഷ്ടിക്കൽ
default_user = User.find_or_create_by(email: 'default@example.com') do |user|
  user.name = 'Default User'
  user.password = 'password123' # Default password (സുരക്ഷിതമാക്കുക)
  user.phone = '9876543210'     # ഫോൺ നമ്പർ (ഓപ്ഷണൽ)
end

puts "Default user created: #{default_user.email}"

# Company ഡാറ്റ സൃഷ്ടിക്കുക
companies = [
  { name: 'Tech Corp', location: Faker::Address.city },
  { name: 'Creative Solutions', location: Faker::Address.city },
  { name: 'Global Enterprises', location: Faker::Address.city },
  { name: 'InnoVision', location: Faker::Address.city },
  { name: 'NextGen Solutions', location: Faker::Address.city }
]

# Company.location ഫീൽഡ് ഡാറ്റാബേസിൽ ഉള്ളതായി ഉറപ്പാക്കുക
companies.each do |company_data|
  Company.find_or_create_by!(name: company_data[:name]) do |company|
    if company.respond_to?(:location) # location ഫീൽഡ് ഉണ്ടായാൽ മാത്രം സജ്ജമാക്കുക
      company.location = company_data[:location]
    end
  end
end

puts "Created #{Company.count} companies."

# ജോബ് ഡാറ്റ സൃഷ്ടിക്കുക
job_titles = [
  'Software Engineer', 'Data Analyst', 'Web Developer', 'Project Manager',
  'Graphic Designer', 'Content Writer', 'Marketing Manager', 'Product Manager',
  'Sales Executive', 'HR Specialist', 'Quality Assurance Engineer',
  'Database Administrator', 'Network Administrator', 'Cybersecurity Analyst',
  'System Analyst', 'UI/UX Designer', 'Mobile App Developer', 'DevOps Engineer',
  'Cloud Engineer', 'Business Analyst', 'Financial Analyst', 'Operations Manager',
  'Customer Support Specialist'
]

job_titles.each do |title|
  Job.find_or_create_by!(title: title) do |job|
    job.description = Faker::Lorem.paragraph  # Random description
    job.location = Faker::Address.city       # Random city
    job.salary = Faker::Number.between(from: 30_000, to: 150_000) # Random salary
    job.company_id = Company.pluck(:id).sample # Random company
    job.user_id = default_user.id            # Associate with default user
  end
end

puts "Created #{Job.count} job listings."

# അഡ്മിൻ യൂസർ സൃഷ്ടിക്കുക
admin_email = 'admin@example.com'
unless AdminUser.exists?(email: admin_email)
  AdminUser.create!(
    email: admin_email,
    password: 'password',
    password_confirmation: 'password'
  )
  puts "Admin user created: #{admin_email} / password"
end
