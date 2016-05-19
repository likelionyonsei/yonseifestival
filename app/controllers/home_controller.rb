class HomeController < ApplicationController
  # 게시판 용
  # def index
  #   @one_post = Post.find(params[:post_id])
  # end 
  def indec
    
  end
  
  def index
    @top_post = Post.last(8).reverse
  #  now_hour = Time.now.hour
  #  now_min = Time.now.min
  #  now_convert = (60*(now_hour-13)+now_min)/25
  #  now_day = Time.now.day
    
   # if now_day == 19
     #  performs19 = Perform.where('day==19').select(:name, :at, :id, :time_hour, :time_min)
     #  @performnow0 = perform19.where({at:'0'}).select(:name, :at, :id, :time_hour, :time_min)[now_convert]
     #  @performnow1 = perform19.where({at:'1'}).select(:name, :at, :id, :time_hour, :time_min)[now_convert]
     #  @performnow2 = perform19.where({at:'2'}).select(:name, :at, :id, :time_hour, :time_min)[now_convert]
   # else
      # performs20 = Perform.where('day==20').select(:name, :at, :id, :time_hour, :time_min)
      # @performnow0 = perform20.where({at:'0'}).select(:name, :at, :id, :time_hour, :time_min)[now_convert]
      # @performnow1 = perform20.where({at:'1'}).select(:name, :at, :id, :time_hour, :time_min)[now_convert]
      # @performnow2 = perform20.where({at:'2'}).select(:name, :at, :id, :time_hour, :time_min)[now_convert]      
    #end

    
  end 
  
  def notice_write 
  end
  def notice_view
    @one_notice = Notice.find(params[:notice_id])
  end
  
  def noticereply_write
    noticereply = Noticereply.new
    noticereply.noticecontent = params[:xi]
    noticereply.notice_id = params[:id_of_post]
    noticereply.save
    redirect_to :back
  end 
  
  def notice
   notice = Notice.new  
   notice.noticetitle = params[:title]
   notice.noticecontent = params[:content]
   notice.noticewriter = params[:writer]
   notice.save
   redirect_to "/list"
  end
  
  def reply_write
    reply = Reply.new
    reply.content = params[:xi]
    reply.post_id = params[:id_of_post]
    reply.save
    redirect_to :back
  end
  
  def write
    new_post = Post.new
    new_post.title = params[:title]
    new_post.writer = params[:writer]
    new_post.content = params[:content]
     if new_post.save
      redirect_to "/list"
    elsif (params[:title] == "")
      render :text => new_post.errors.messages[:title]
    else
      render :content => new_post.errors.messages[:content]
    end
  end
  
  def list
    @every_post = Post.all.order("id desc")
    @notice_post= Notice.all.order("id desc")
    
  end
  
  def destroy
    @one_post = Post.find(params[:post_id])
    @one_post.destroy
    redirect_to "/list"
  end
  def delete
    @one_notice = Notice.find(params[:notice_id])
    @one_notice.destroy
    redirect_to "/list"
  end
  
  def update_view
    @one_post = Post.find(params[:post_id])
    # @one_post.title = params[:title]
    # @one_post.writer = params[:writer]
    # @one_post.content = params[:content]
    # @one_post.save
  end
  
  def siljae
    @one_post = Post.find(params[:post_id])
    @one_post.title = params[:title]
    @one_post.writer = params[:writer]
    @one_post.content = params[:content]
    @one_post.save
    redirect_to :back
  end
  
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

  # pub 용 
  def publist
    @pubs = Pub.all
    @pubs19 = Pub.where('day==19').select(:name, :at, :id, :intro, :imagefile, :list)
    @pubs20 = Pub.where('day==20').select(:name, :at, :id, :intro, :imagefile, :list)
  end 
  
  def publist3
    @pubs = Pub.all
    @pubs19 = Pub.where('day==19').select(:name, :at, :id)
    @pubs20 = Pub.where('day==20').select(:name, :at, :id)
  end
  
  def reply_pub
      #params[:nickname]
      reply= Pubreply.new
      reply.content = params[:content]
      reply.pub_id = params[:pub_id]
      reply.nickname=params[:nickname]
      reply.save 
      redirect_to :back
  end
  
  def pubintro
    @onepub = Pub.find(params[:pub_id])
    @onepuburl = "https://daehanbo-limgoodfam.c9users.io/pubintro/"+@onepub.id.to_s
  end
  
  #perform용
  def performlist
    @performs = Perform.all
    @performs19 = Perform.where('day==19').select(:name, :at, :id, :time_hour, :time_min )
    @performs19_baek = @performs19.where('at==2').select(:name, :at, :id, :time_hour, :time_min)
    @performs19_gate = @performs19.where('at==1').select(:name, :at, :id, :time_hour, :time_min)
    @performs19_gong = @performs19.where('at==0').select(:name, :at, :id, :time_hour, :time_min)
    @performs20 = Perform.where('day==20').select(:name, :at, :id, :time_hour, :time_min)
    @performs20_baek = @performs20.where('at==2').select(:name, :at, :id, :time_hour, :time_min)
    @performs20_gate = @performs20.where('at==1').select(:name, :at, :id, :time_hour, :time_min)
    @performs20_gong = @performs20.where('at==0').select(:name, :at, :id, :time_hour, :time_min)
  end 
  
  def reply_perform
      reply= Performreply.new
      reply.content = params[:content]
      reply.perform_id = params[:perform_id]
      reply.nickname=params[:nickname]
      reply.save 
      redirect_to :back
  end
  #백기관앞 정문앞 공학원앞
  def performintro
    @oneperform = Perform.find(params[:perform_id])
    @oneperformulr = "https://daehanbo-limgoodfam.c9users.io/performintro/"+@oneperform.id.to_s
  end
  
  #좋아요 
  def publike
    @onepub = Pub.find(params[:pub_id])
    @onepub.like = params[:likenum]
    @onepub.save
    redirect_to :back
  end
  
  def performlike
  end
  
  # #db 찾기용
  # def searchdb
  #     #주점번호를 쳤을 경우
  #     @pubfind = params[:search]
  #     if (params[:searchby]=='0') 
  #       @pubfind = params[:search]
  #       if (@pubfind.to_i > 45) 
  #         @message = "주점은 45개까지 있습니다"
  #       else 
  #         @searchid=Pub.where('at==#{@pubfind}').select(:id)
  #         redirect_to url_for(action: :pubintro, id: @searchid.first)
  #       end
  #     #주점명을 쳤을 경우..
  #     else
  #       @pubfind = Pub.where('name==#{params[:search]}')
  #       if (@pubfind.nil? == true)
  #         @message = "없어 이놈아"
  #       else 
  #         @pubfind.select(:id)
  #         redirect_to '/pubintro/#{@pubfind.select(:id)}'
  #       end
  #     end
  # end
  
end
