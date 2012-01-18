class Dvd < ActiveRecord::Base
	#validate that all feilds are filled
	validates_presence_of :title, :release, :description
	#validate release is 4 digit year
	validates_format_of :release,
						:with => %r{^\d{4}$},
						:message => " must be a four digit year."
end
