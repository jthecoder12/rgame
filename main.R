library(raylibr)

WIDTH <- 1280
HEIGHT <- 720

init_window(WIDTH, HEIGHT, "R Game")

ballX <- WIDTH / 2
ballY <- HEIGHT / 2

targetPosition <- c(runif(1, 0, WIDTH), runif(1, 0, HEIGHT))

SPEED <- 600 / get_monitor_refresh_rate(get_current_monitor())

score <- 0

while(!window_should_close()) {
  if(is_key_down(68)) ballX <- ballX + SPEED
  if(is_key_down(65)) ballX <- ballX - SPEED
  if(is_key_down(83)) ballY <- ballY + SPEED
  if(is_key_down(87)) ballY <- ballY - SPEED
  
  if(check_collision_circles(c(ballX, ballY), 30, targetPosition, 20)) {
    targetPosition <- c(runif(1, 0, WIDTH), runif(1, 0, HEIGHT))
    score <- score + 1
  }
  
  begin_drawing()
  
  clear_background("white")
  
  draw_text(paste("Score:", score), 0, 0, 30, "black")
  
  draw_circle(ballX, ballY, 30, "red")
  draw_circle_v(targetPosition, 20, "blue")
  
  end_drawing()
}

close_window()
