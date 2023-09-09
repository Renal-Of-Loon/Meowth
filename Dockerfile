FROM gorialis/discord.py:3.10.10-bullseye-master-extras

WORKDIR /app

COPY requirements.txt ./
RUN pip install -r requirements.txt

# Import the repository signing key:
RUN apt update&&\
    apt -y install postgresql postgresql-client

COPY ./meowth ./meowth/
COPY ./setup.py ./
COPY ./README.md ./
COPY ./emoji.rar ./

RUN python setup.py install

ENTRYPOINT ["python", "meowth/launcher.py", "-r"]