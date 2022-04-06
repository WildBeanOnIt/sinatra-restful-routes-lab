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

  # new
  get '/recipes/new' do 
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    render to "/recipes/#{@recipe.id}"
  end
  
  #show
  get "/recipes/:id" do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end
  
  # delete
  delete "/recipe/:id" do
    Recipe.destroy(params[:id])
    redirect to "/recipes"
  end


end

