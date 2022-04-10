class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  # index
  get '/recipes' do
    # binding.pry
    @recipes = Recipe.all
    erb :index
  end

  # sends to index
  get "/" do
    redirect "/recipes"
  end

  # index
  get "/recipes" do
    erb :index
  end

  # new
  get '/recipes/new' do 
    @recipes = Recipe.new
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end
  
  #show
  get "/recipes/:id" do
    @recipes = Recipe.find_by_id(params[:id])
    erb :show
  end

  # edit
  get "/recipes/:id/edit" do
    @recipes = Recipe.find(params[:id])
    erb :edit
  end
  
  # delete
  delete "/recipes/:id" do
    Recipe.destroy(params[:id])
    redirect to "/recipes"
  end


end

