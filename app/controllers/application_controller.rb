
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    hi
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  post '/posts' do
    Post.create(params)
    redirect '/posts'
  end

  get '/posts/:id/edit' do
    @post = Post.find_by(id: params['id'])
    erb :edit
  end

  get '/posts/:id' do
    @post = Post.find_by(id: params['id'])
    erb :show
  end

  patch '/posts/:id' do
    @post = Post.find_by(id: params['id'])
    @post.update(name: params['name'], content: params['content'])
    erb :show
  end

  delete '/posts/:id/delete' do
    Post.find_by(id: params['id']).destroy
    erb :delete
  end

end
