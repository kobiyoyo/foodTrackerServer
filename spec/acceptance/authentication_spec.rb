require 'acceptance_helper'
require_relative '../support/authentication'

resource "Authentication" do
  let!(:users) { FactoryBot.create(:user, email:'rilux@gmail.com',password:'123234566',role: 'admin')  }
  let!(:faith) { User.create(username:'fina',email:'fina@gmail.com',password:'123234566',role:'admin') }
  let!(:fina) { User.create(username:'faith',email:'faith@gmail.com',password:'123234566',role:'client') }

  before do
    header 'Content-Type', 'application/json'
  end

  post "auth/signup" do
  	route_summary 'This is used to signup a user'
  	parameter :username, 'User username'
  	parameter :email,'User email'
  	parameter :password,'User password'
  	parameter :password_confirmation, 'User password confirmation'
    example_request "Sign up a user" do
    explanation 'Sign up a user'
    do_request(username:'simon',email:'simon@gmail.com',password:'123234566',password_confirmation:'123234566')
      expect(status).to eq 201
    
    end
  end
  post "auth/signin" do

  	route_summary 'This is used to signin a user'
    with_options scope: :auth, with_example: true do
      parameter :email,'User email'
      parameter :password,'User password'
    end

     context "200" do

        example 'Sign in user' do
          request = {
            auth: {
                    email:users.email, 
                    password:users.password
            }
          }
          
           do_request(request)
 
          expect(status).to eq(201)
      
        end
      end


end
end