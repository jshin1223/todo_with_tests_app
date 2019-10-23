require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#toggle_complete!' do
    it 'should switch complete to false if it began as true' do
      task = Task.create(complete: true)
      task.toggle_complete!
      expect(task.complete).to eq(false)
    end


    it 'should switch complete to true if it began as false' do 
      task = Task.create(complete: false)
      task.toggle_complete!   
      expect(task.complete).to eq(true)
    end 
  end

  describe '#toggle_favorite!' do 

    it 'should switch favorite to false if it began as true' do
      task = Task.create(favorite: true)
      task.toggle_favorite!
      expect(task.favorite).to eq(false)
    end


    it 'should switch favorite to true if it began as false' do
      task = Task.create(favorite: false)
      task.toggle_favorite!
      expect(task.favorite).to eq(true)
    end
  end

  describe '#overdue?' do 
    it 'should return true if the current time is past the deadline' do
      task = Task.create(deadline: Time.now - 1.hour)
      result = task.overdue? 
      expect(result).to eq(true)
    end
  end 

  describe '#increment_priority!' do
    it 'should return the increased priority' do
      task = Task.create(priority: 3)
      result = task.increment_priority!
      expect(result).to eq(4)
     end
  end 


end
