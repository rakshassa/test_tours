class Tour < ActiveRecord::Base
	include SessionsHelper

	scope :limit_to_user, ->(user_id_param) { where(:tours => { :user_id => user_id_param } ) }
end
