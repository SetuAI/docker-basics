# with help of certain commands we will create an image
# baseImage is the 1st layer (usually linux image)
# FROM command is used to specify the base image
# copy command is used to copy the base image to a new image

# in docker image we create an app folder , and all the files are copied in app folder
# app folder will be created in image
# . means local repo

FROM python:3.11-alpine
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
CMD python app.py


# in ordet to build an image
# write docker build -t <image_name> . (docker build -t welcome-app .) in terminal
# you will see it starts to build stuff

# if you want to see if the docker image are built or not
# run : (docker images) in terminal
# and you will find rebit-app image created

# now is the time to run docker image as container

# there are 2 things wrt this : 
# to run, HOST PORT AND CONTAINER PORT mapping needs to be done
# run (docker run -p 5000:5000 rebit-app)
# 5000 : host port , 5000 : container port

# when we run this, we see 2 IPs
# http://127.0.0.1:5000/ , you will one of them works on container
# also localhost:5000 works

# you can add one more terminal and run (docker ps) 
# which tells us which containers are runnning  

# you can also check in docker desktop the container will be runnning
# if you want to stop the docker container (docker stop <container id>)
# docker stop 56208cc8cf92
# rerun docker images 

# Now deploy this image in the docker hub repository
# then you can also pull this image and run it