class ApiController < ApplicationController
  
  def static
    send_file File.join(Rails.root, 'public', 'images', "chart#{rand(4)+1}.png"), :type => 'image/png', :disposition => 'inline'
  end
  
  def dynamic
   
    require 'open-uri'
    require 'uri'
    
    #sleep 5
    
    url = case params[:id] 
     when "1"
        "http://chart.apis.google.com/chart?chf=bg,lg,270,EFEFEF,0,000000,1&chxt=y&chbh=a&chs=280x405&cht=bvg&chco=85c024&chds=5,100&chd=t:#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)}&chtt=Monthly+Sales"
     when "2"
       
       "http://chart.apis.google.com/chart?chf=bg,lg,270,EFEFEF,0,000000,1&chs=280x405&cht=p&chco=85c024&chds=5,100&chd=t:#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)}&chtt=Income"
     when "3"
         "http://chart.apis.google.com/chart?chf=bg,lg,270,EFEFEF,0,000000,1&chxt=y&chbh=a&chs=280x405&cht=bvg&chco=0068b4&chds=5,100&chd=t:#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)}&chtt=Clients"
     else
        "http://chart.apis.google.com/chart?chf=bg,lg,270,EFEFEF,0,000000,1&chs=280x405&cht=p&chco=0068b4&chds=5,100&chd=t:#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)}&chtt=Net+Gross"

     end

    data = open(url.gsub('|', '%7c')).read
    
    send_data data, :type => 'image/png', :disposition => 'inline'
  end
  
  def charts
    Chart.delete_all
    (1..4).each {|i| Chart.create(:title => "Chart #{i}", :url => "http://shinydashboard-server.heroku.com/chartfeed/#{i}")}
    
    respond_to do |format|
      format.atom
    end
  end
  
  
  def chart
   
    
    #sleep 3
    
    @urlfeed = case params[:id] 
     when "1"
        "http://chart.apis.google.com/chart?chf=bg,lg,270,EFEFEF,0,000000,1&chxt=y&chbh=a&chs=280x405&cht=bvg&chco=A2C180&chds=5,100&chd=t:#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)}&chtt=Monthly+Sales"
     when "2"
       "http://chart.apis.google.com/chart?chf=bg,lg,270,EFEFEF,0,000000,1&chs=280x405&cht=p&chco=7777CC&chds=5,100&chd=t:#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)}&chtt=Income"
     when "3"
         "http://chart.apis.google.com/chart?chf=bg,lg,270,EFEFEF,0,000000,1&chxt=y&chbh=a&chs=280x405&cht=bvg&chco=990066&chds=5,100&chd=t:#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)}&chtt=Clients"
     else
        "http://chart.apis.google.com/chart?chf=bg,lg,270,EFEFEF,0,000000,1&chs=280x405&cht=p&chco=A2C180&chds=5,100&chd=t:#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)},#{rand(100)}&chtt=Net+Gross"

     end.gsub('|', '%7c')

     @identifier = "http://shinydashboard-server.heroku.com/chartfeed/#{params[:id]}"

     respond_to do |format|
       format.atom
     end

  end


  
end
