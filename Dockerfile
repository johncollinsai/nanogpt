FROM python:slim

WORKDIR /home/nanogpt

COPY requirements.txt requirements.txt 
RUN python -m venv venv
# RUN apt install apturl
RUN venv/bin/pip install -r requirements.txt

COPY nanogpt.ipynb input.txt nanogpt-dalle.png boot.sh ./ 

RUN chmod a+x boot.sh
ENV PORT 8080

ENTRYPOINT ["./boot.sh"]



