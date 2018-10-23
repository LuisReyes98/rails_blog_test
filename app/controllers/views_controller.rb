class ViewsController < ActionController::Base
	def index
		token = "406fc051649392f7aeb828ccb869e6f9804CDB21AA24841B37019B30D22D008766C54B6C"

		@wialon = Wialon.new() #nueva variable Wialon

		@response = @wialon.login(token)
		return render json: @response
		#return render json: Time.new(2018,1,10,16,20,0,"-05:00").strftime('%s')

		params={itemId:15943354,#se necesita un id valido para la peticion de mensajes
				timeFrom: 1515619200,
				timeTo:	1531257600,
				
				flags:(1+0),
				flagsMask:0,
			 	loadCount:99}

		@messages= @wialon.messages_load_interval(params)		

		@response=[]

		@messages['messages'].each do |message|
			#return render json: {}
			@response.push(message)
		end

		#return render json: @messages

=begin
		params = {"spec":{
							itemsType: "avl_unit",	
							propName: "sys_name",
					        propValueMask: "*",
					        sortType: "sys_name"	
			     		},
					    force: 1,			
					    flags:(1 + 4096 + 8), #flags 1:base, 4096:sensors, 8:custom_fields		
			       		from: 0,			
				    	to: 0
					   }

 		@units = @wialon.core_search_items(params)

		@response = []
		
		@units['items'].each do |unit|
			return render json: {units: @units, unit: unit}
			@response.push(unit['nm'])
		end
=end
		
	end
end