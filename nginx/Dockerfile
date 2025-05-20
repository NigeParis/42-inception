FROM python:3.11.2
RUN apt update -y && apt install upgrade -y
RUN apt install nginx -y
CMD ["nginx", "-g", "daemon off;"]

