# Instruction on how to run this project
1. Install ruby bundler
2. Install gems to vender folder --- bundle install --path=./vendor
3. Setup database and seed database --- in application root directory run rake db:setup . This process might take a while
4. Start rails server --- in application root directory run bin/rails server -b 0.0.0.0
5. Go to http://localhost:3000/ to see the page