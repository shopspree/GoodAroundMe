json.user do
  json.partial! @profile
  json.partial! @job_profile
  json.partial! @groups.last if @groups.any?
end