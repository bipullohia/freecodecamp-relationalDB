#!/bin/bash

#connecting to the postgres db
#the -c flag will run the single command and exit, rest flags are for formatting
PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c" 
echo $($PSQL "truncate students, majors, courses, majors_courses")


#Script to insert data from courses.csv and students.csv into students database
cat courses.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != major ]] #checking to see if the first row of the csv file is for headers or actual data. Skip if it is heading and continue if it is not
    then
      #get major_id
      MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
      #if not found
      if [[ -z $MAJOR_ID ]]
      then
        #insert major
        INSERT_MAJOR_RESULT=$($PSQL "insert into majors(major) values ('$MAJOR')")
        if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
        then
          echo "Inserted into majors, $MAJOR"
        fi
        #get new major_id
        MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
      fi

      #get course_id
      COURSE_ID=$($PSQL "select course_id from courses where course='$COURSE'")
      #if not found
      if [[ -z $COURSE_ID ]]
      then
        #insert course
        INSERT_COURSE_RESULT=$($PSQL "insert into courses(course) values ('$COURSE')")
        if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
        then
          echo "Inserted into courses, $COURSE"
        fi
        #get new course_id
        COURSE_ID=$($PSQL "select course_id from courses where course='$COURSE'")
      fi
      
      #insert into majors_courses
      INSERT_MAJORS_COURSES_RESULT=$($PSQL "insert into majors_courses(major_id, course_id) values ($MAJOR_ID, $COURSE_ID)")
      if [[ $INSERT_MAJORS_COURSES_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into majors_courses, $MAJOR : $COURSE"
      fi
  fi  
done

#reading info from the students.csv to insert into students table
cat students.csv | while IFS="," read FIRST LAST MAJOR GPA
do
  if [[ $FIRST != "first_name" ]]
  then
    #get major_id
    MAJOR_ID=$($PSQL "select major_id from majors where major='$MAJOR'")
    #if not found
    if [[ -z $MAJOR_ID ]]
    then
      #set to null
      MAJOR_ID=null
    fi
    #insert student
    INSERT_STUDENT_RESULT=$($PSQL "insert into students(first_name, last_name, major_id, gpa) values ('$FIRST', '$LAST', $MAJOR_ID, $GPA)")
    if [[ $INSERT_STUDENT_RESULT == "INSERT 0 1" ]]
    then
      echo "Inserted into students, $FIRST $LAST"
    fi
  fi
done

#IFS="," denotes the file separator so that we don't separate text on white spaces
#while setting the while loop with pipe (|), we have given the header names MAJOR and COURSE