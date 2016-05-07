class HomeController < ApplicationController


  # 파일 import 용 
  def importpub
    Pub.import(params[:pubfile])
    redirect_to '/taki', notice: "Products imported."
  end
  def importperform
    Perform.import(params[:performfile])
    redirect_to '/taki', notice: "Products imported."
  end
  def importbooth
    Booth.import(params[:boothfile])
    redirect_to '/taki', notice: "Products imported."
  end
  def taki
    @pubs = Pub.all
    @performs = Perform.all
    @boothes = Booth.all
  end

  # pub
  def publist
    @pubs = Pub.all
    @pubs19 = Pub.where('day==19').select(:name, :at, :id)
    @pubs20 = Pub.where('day==20').select(:name, :at, :id)
  end 
  
  def reply_pub
      #params[:nickname]
      reply= Pubreply.new
      reply.content = params[:content]
      reply.pub_id = params[:pub_id]
      reply.save 
      redirect_to :back
  end
  
  def pubintro
    @onepub = Pub.find(params[:pub_id])
    @onepuburl = "https://daehanbo-limgoodfam.c9users.io/pubintro/"+@onepub.id.to_s

  end
  

  def searchdb
 
  
  
  end


end
