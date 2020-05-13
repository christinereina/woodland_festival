require('sinatra')
require('sinatra/reloader')
require('./lib/stage')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @stages = Stage.all
  erb(:stages)
end

get('/stages') do
  @stages = Stage.all
  erb(:stages)
end

get('/stages/new') do
  erb(:new_stages)
end

get('/stages/:id') do
  @stages = Stage.find(params[:id].to_i())
  erb(:stage)
end

get('/stages/:id/edit') do
  @stages = Stage.find(params[:id].to_i())
  erb(:edit_stage)
end


get('/stage') do
  @stages = Stage.all
  erb(:stages)
end

post('/stages') do
  name = params[:stage_name]
  stage = Stage.new(name,nil)
  stage.save()
  @stages = Stage.all()
  erb(:stages)
end


# patch('/stages/:id') do
#   @stage = Stage.find(params[:id].to_i())
#   @stage.update(params[:name])
#   @stages = Stage.all
#   erb(:stages)
# end
