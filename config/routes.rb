Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/hilo' => 'hilo#try'
  get '/new_game' => 'hilo#reset'

  get '/magic' => 'magic#check'

  get '/adventure' => 'adventure#choice'
  get '/choicea' => 'adventure#choicea'
  get '/choiceb' => 'adventure#choiceb'
  get '/choicec' => 'adventure#choicec'
  get '/choiced' => 'adventure#choiced'
  
  root to: 'main#start'
end
