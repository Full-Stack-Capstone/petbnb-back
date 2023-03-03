require 'rails_helper'

RSpec.describe PetRoomsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/pet_rooms').to route_to('pet_rooms#index')
    end

    it 'routes to #show' do
      expect(get: '/pet_rooms/1').to route_to('pet_rooms#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/pet_rooms').to route_to('pet_rooms#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/pet_rooms/1').to route_to('pet_rooms#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/pet_rooms/1').to route_to('pet_rooms#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/pet_rooms/1').to route_to('pet_rooms#destroy', id: '1')
    end
  end
end
