FROM python:3.12.6
RUN apt-get update && apt-get upgrade -y
RUN apt-get install git curl python3-pip ffmpeg -y
RUN pip3 install -U pip
RUN python3 -m pip install --upgrade pip
RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs
COPY . /repthon
WORKDIR /repthon
RUN pip3 install -U -r requirements.txt
EXPOSE 8080
ENV PATH=/repthon:$PATH
CMD ["bash","start.sh"]
