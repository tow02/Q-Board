rails g scaffold Role name:text description:text
rails g scaffold RoomSubject name:text
rails g scaffold Question user:references room_subject:references title:text content:text total_vote:integer total_star:integer
rails g scaffold Tag name:text
rails g scaffold QuestionTag question:references tag:references
rails g scaffold Answer question:references user:references content:text total_vote:integer is_accepted:boolean
rails g scaffold Comment question:references answer:references user:references content:text
rails g model Image user:references question:references answer:references

rails g migration add_role_to_users role:belongs_to
