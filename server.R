
library(shiny)

shinyServer(function(input, output) {

  output$calculations <- renderTable({
  	
  	fv_of_inv <- ((1 + input$exp_rr / 100) ^ input$years) * input$investment
  	value_at_exit <- input$pe * input$income
  	vc_final_own <- fv_of_inv / value_at_exit
  	
  	# you create this many shares on top of what you have to give to VC
  	vc_shares <- vc_final_own * input$init_shares / (1 - vc_final_own)
  	
  	# the price that the VC's are paying for each share you just made up
  	price_per_share <- input$investment / vc_shares
  	
  	post_money_val <- input$investment / vc_final_own
  	
  	data.frame(
  			labels = c('Required FV', 
  					   'Our Value at Exit',
  					   'VC Owns',
  					   'VC Shares',
  					   'Price Per Share',
  					   'Post-money Value'),
  			values = c(sprintf('$%.2f', fv_of_inv),
  					   sprintf('$%.2f', value_at_exit),
  					   paste0(round(vc_final_own, digits=5)*100, '%'),
  					   sprintf('%.0f', vc_shares),
  					   sprintf('$%.2f', price_per_share),
  					   sprintf('$%.2f', post_money_val))
  		)
  }) 

})
