RecipeApi::Application.routes.draw do

  get 'tasks' => 'todos#tasks'
  post 'task' => 'todos#create'
  put 'task' => 'todos#update'
  delete 'task' => 'todos#destroy'

end
