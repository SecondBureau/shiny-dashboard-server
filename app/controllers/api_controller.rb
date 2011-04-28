class ApiController < ApplicationController
  
  def static
    send_file File.join(Rails.root, 'public', 'images', "chart#{rand(4)+1}.png"), :type => 'image/png', :disposition => 'inline'
  end
  
end
