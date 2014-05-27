class Project < ActiveRecord::Base

	has_many :tasks, :dependent => :destroy

	scope :complete, lambda { where(:completed => true) }
	scope :incomplete, lambda { where(:completed => false) }
	scope :sorted_by_date, lambda { order('projects.due_date DESC') }
	
end
