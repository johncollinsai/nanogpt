FROM python:slim

WORKDIR /home/posts/nanogpt

COPY requirements.txt requirements.txt 
RUN python -m venv venv
RUN venv/bin/pip install -r requirements.txt

# I use boot.sh rather than ENTRYPOINT in the Dockerfile because the exec command
# in my boot.sh does not work here in Dockerfile in ENTRYPOINT. Don't know why
COPY nanogpt.ipynb nanogpt-dalle.png boot.sh ./ 

RUN chmod a+x boot.sh
ENV PORT 8080

# I follow https://github.com/photonics-project/notebooks/blob/main/Dockerfile
# but put jimustafa's ENTRYPOINT into boot.sh
ENTRYPOINT ["./boot.sh"]



