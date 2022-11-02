require 'rails_helper'

describe 'Users API', type: :request do
    describe 'GET /users' do
        it 'returns all users' do
            FactoryBot.create(:user, username: 'JohnG', password: '123456')
            FactoryBot.create(:user, username: 'Shane', password: 'football')

            get '/users'

            # print JSON.parse(response.body)
            expect(response).to have_http_status(:success)
            expect(JSON.parse(response.body).size).to eq(2)
        end
    end

    describe 'GET /users/:id' do
        let!(:user) {FactoryBot.create(:user, username: 'johngardner', password: '654321')}
        
        
        it 'returns a specific user' do

            get "/users/#{user.id}"

            expect(response).to have_http_status(:success)
            expect(JSON.parse(response.body)['id']).to eq(user.id)
        end
    end

    describe 'POST /users' do
        it 'creates a new user successfully, simulating signing up' do
            expect{
                post '/users', params: {user: {username: 'nobleport', password: '123789'}}
        }.to change { User.count }.from(0).to(1)
            expect(response).to have_http_status(:success)
        end
    end

    describe 'DELETE /users/:id' do
        let!(:user) {FactoryBot.create(:user, username: 'JohnG', password: '123456')}

        it 'destroys a user simulating a sign out' do
            expect {
                delete "/users/#{user.id}"
        }.to change {User.count}.from(1).to(0)
            expect(response).to have_http_status(:no_content)
        end
    end
end

