 
#	Import the Bollywood data set in Rstudio in a variable named bollywood


  bollywood <-read.csv("bollywood.csv") # Importing data from external csv file into R environment 
                                                             # and storing it into bollywood dataframe
  View(bollywood)                                            # Viewing the data of csv file in R
  


#	When you import a data set, R stores character vectors as factors (by default)
# You can check the structure of the data frame by using str()
  str(bollywood)                                            # Viewingthe structure of bollywood data frame


# You can change the attribute 'Movie' from factor to character type using the given command
  
  bollywood$Movie <- as.character(bollywood$Movie)
	 

#Q1.
#	Access the last 10 movies (from the bottom of the Bollywood data frame) using column bollywood$Movie
# Store the names of those movies in last_10 vector (in the same order)
     
	last_10 <- tail(bollywood$Movie,n = 10L) # getting the last 10 movies, here argument n specify the number of lines we are fething
	last_10
	 
  
#Q2.
#	Find out the total number of  missing values (NA) in the bollywood data frame.
# Store the result in na_bollywood vector
     
	na_bollywood <- length(which(is.na.data.frame(bollywood))) # calculating the number of NA values for each column of data frame
	na_bollywood
	  
	
#Q3.
#	Write the command to find out which movie tops the list in terms of Total Collections
# Store the movie name in variable named top_movie
  
	top_movie <- bollywood$Movie[which(bollywood$Tcollection == max(bollywood$Tcollection, na.rm = T))]     # Movie with highest Total Collection and also by skipping the NA values
  top_movie
  
#Q4
#	Write the command to find out which movie comes second on the list in terms of Total Collections
# Store the movie name in variable named top_2_movie
  
x<- nrow(bollywood)
len <- which(sort((bollywood$Tcollection))[x-1]== bollywood$Tcollection)
bollywood$Movie[len]
                                                # Movie with 2nd highest collection by using the sort()
  
  
# Now let's find out the movies shot by Shahrukh, Akshay and Amitabh separately.
# subset() function is used for that. The code has already been written for you. 
 
	shahrukh <- subset(bollywood, Lead == "Shahrukh")
	akshay <- subset(bollywood, Lead == "Akshay")
	amitabh <- subset(bollywood, Lead  == "Amitabh")

# You can view what the above data frames look like
	shahrukh
	akshay
	amitabh

	   
#Q5
#	What is the total collection of Shahrukh, Akshay and Amitabh movies individually?
# You can use	a column named 'Tcollection' for this 
    
        shahrukh_collection <- sum(shahrukh$Tcollection,na.rm=TRUE)
        shahrukh_collection                         # Calculating the Total Collection of Shahrukh movies
    
         akshay_collection <- sum(akshay$Tcollection,na.rm=TRUE)
	       akshay_collection                          # Calculating the Total Collection of Akshay movies
    
	amitabh_collection <- sum(amitabh$Tcollection,na.rm=TRUE)
	      amitabh_collection                          # Calculating the Total Collection of Amitabh movies
    
	
#Q6  
# Write command/s to find out how many movies are in Flop, Average, Hit and Superhit categories in the entire Bollywood data set.

          movie_details <- summary(bollywood$Verdict)  # Calculating number of Flop, Average, Hit, and superhit movies in entire DataFrame
          movie_details
#You can use SAPPLY function if you want to apply a function specific columns in a data frame 
#You can write a command to find the maximum value of Ocollection, Wcollection, Fwcollecion and Tcollection using sapply
  
#Q7 
# Write a command to find the names of the movies which have the maximum Ocollection, Wcollection, Fwcollecion & Tcollection
# Store the names of 4 movies in same sequence in movie_result vector

          pos <- sapply(bollywood[,c(4:7)],function(x)which.max(x))         
          movie_result <-bollywood$Movie[pos]
          movie_result                                  #Finding out the names of the movies having maximun Ocollection, Wcollection, Fwcollecion & Tcollection
          
	

   
    


    
    
    