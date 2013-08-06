json.job_profile do |json|
  json.(job_profile, :title, :created_at, :updated_at)
  json.organization job_profile.organization.name
end