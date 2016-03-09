rails g model Role name:text description:text
rails g model UserRole user:references role:references
rails g scaffold Room name:text
rails g scaffold Question user:references room:references title:text
rails g model Image user:references answer:references
rails g model Comment answer:references user:references content:text
rails g scaffold Answer question:references user:references content:text is_question:boolean is_accepted:boolean
rails g model Vote answer:references user:references vote_type:integer
rails g model AnswerTag answer:references tag:references
rails g scaffold Tag name:text
