
enable :sessions

post '/users' do
  user = User.new(params[:user])
  user.save
  if user.persisted?
    session[:user_id] = user.id
    redirect '/'
  else
    erb :"users/new"
  end
end

get '/users/new' do
  erb :'users/_registration'
end

get '/login' do
  erb :"users/_login-form"
end
