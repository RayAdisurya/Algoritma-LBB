server <- function(input,output){
  
  output$plot_t1 <- renderPlotly({
    t1 <- vids %>% 
      group_by(category_id) %>% 
      summarise(mean_views = mean(views)) %>% 
      arrange(-mean_views) %>%
      mutate(details = paste(category_id,"\n Average Views:", round(mean_views, 3))) %>%
      ggplot(aes(x = reorder(category_id, mean_views), y = mean_views, text = details)) +
      geom_col(aes(fill = category_id)) +
      coord_flip() +
      labs(title = "Average Views") +
      theme_tabs
    
    ggplotly(t1, tooltip = "text")
    
  })
  
  output$plot_t2 <- renderPlotly({
    t2 <- vids %>% 
      group_by(category_id) %>% 
      summarise(total_views = sum(views)) %>% 
      arrange(-total_views) %>%
      mutate(details = paste(category_id,"\n Total Views:", total_views)) %>%
      ggplot(aes(x = reorder(category_id, total_views), y = total_views, text = details)) +
      geom_col(aes(fill = category_id)) +
      coord_flip() +
      labs(title = "Total Views") +
      theme_tabs
    
    ggplotly(t2, tooltip = "text")
    
  })
  
  output$plot_t3 <- renderPlotly({
    t3 <- vids %>% 
      filter(category_id == input$category_1) %>%
      ggplot(aes(x = category_id, y = views)) +
      geom_boxplot(aes(fill = category_id)) +
      coord_flip() +
      labs(title = paste(input$category_1,"Views Distribution")) +
      theme_tabs
    
    ggplotly(t3)
  })
  
  output$plot_t4 <- renderPlotly({
    t4 <- vids %>% 
      filter(channel_title == input$channel_1) %>%
      ggplot(aes(x = channel_title, y = views)) +
      geom_boxplot(aes(fill = channel_title)) +
      coord_flip() +
      labs(title = paste(input$type_select,"Views Distribution")) +
      theme_tabs
    
    ggplotly(t4)
  })
  
  output$plot_t5 <- renderPlotly({
    t5 <- vids %>% # Likes Ratio
      mutate(likes_ratio = 100 * likes / views) %>%
      group_by(category_id) %>%
      summarise(mean_likes_ratio = round(mean(likes_ratio), 3)) %>%
      arrange(-mean_likes_ratio) %>%
      mutate(details = paste(category_id,"\n Mean Likes Ratio:", round(mean_likes_ratio, 3))) %>%
      ggplot(aes(x = reorder(category_id, mean_likes_ratio), y = mean_likes_ratio, text = details)) +
      geom_col(aes(fill = category_id)) +
      coord_flip() +
      labs(title = "Likability (%)") +
      theme_tabs
    
    ggplotly(t5, tooltip = "text")
    
  })
  
  output$plot_t6 <- renderPlotly({
    t6 <- vids %>% # Dislikes Ratio
      mutate(dislikes_ratio = 100 * dislikes / views) %>%
      group_by(category_id) %>%
      summarise(mean_dislikes_ratio = round(mean(dislikes_ratio), 3)) %>%
      arrange(mean_dislikes_ratio) %>%
      mutate(details = paste(category_id,"\n Mean Dislikes Ratio:", round(mean_dislikes_ratio, 3))) %>%
      ggplot(aes(x = reorder(category_id, mean_dislikes_ratio), y = mean_dislikes_ratio, text = details)) +
      geom_col(aes(fill = category_id)) +
      coord_flip() +
      labs(title = "Dislikability (%)") +
      theme_tabs
    
    ggplotly(t6, tooltip = "text")
    
  })
  
  output$plot_t7 <- renderPlotly({
    t7 <- vids %>% # Positive Index
      mutate(positive_index = 100 * (likes - dislikes) / views) %>%
      group_by(category_id) %>%
      summarise(mean_positive_index = round(mean(positive_index), 3)) %>%
      arrange(-mean_positive_index) %>%
      mutate(details = paste(category_id,"\n Mean Positive Index:", round(mean_positive_index, 3))) %>%
      ggplot(aes(x = reorder(category_id, mean_positive_index), y = mean_positive_index, text = details)) +
      geom_col(aes(fill = category_id)) +
      coord_flip() +
      labs(title = "Positivity (%)") +
      theme_tabs
    
    ggplotly(t7, tooltip = "text")
    
  })
  
  output$plot_t8 <- renderPlotly({
    t8 <- vids %>%
      mutate(publish_window = paste(publish_wday, publish_when)) %>%
      filter(category_id == input$category_2) %>%
      group_by(publish_window) %>% 
      summarise(mean_views = mean(views)) %>%
      arrange(-mean_views) %>%
      mutate(details = paste(publish_window,"\n Average Views:", round(mean_views, 0))) %>%
      ggplot(aes(x = reorder(publish_window, mean_views), y = mean_views, text = details)) +
      geom_col(aes(fill = publish_window)) +
      coord_flip() +
      labs(title = paste(input$category_2, "Optimal Upload Hours")) +
      theme_tabs
    
    ggplotly(t8, tooltip = "text")
    
  })
}