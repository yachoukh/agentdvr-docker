FROM mcr.microsoft.com/dotnet/core/runtime:3.1.4-bionic

WORKDIR /app

RUN apt-get update
RUN apt-get -y install software-properties-common unzip wget libtbb-dev libc6-dev
RUN add-apt-repository ppa:jonathonf/ffmpeg-4
RUN apt-get update
RUN apt-get install -y ffmpeg

RUN wget https://ispyfiles.azureedge.net/downloads/Agent_Linux64_2_7_9_0.zip

RUN unzip Agent_Linux64_2_7_9_0.zip

EXPOSE 554/udp
EXPOSE 554
EXPOSE 8090
ENV ASPNETCORE_URLS http://*:8090
ENTRYPOINT ["dotnet", "Agent.dll"]
