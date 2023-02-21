FROM ubuntu:20.04 

WORKDIR /app

COPY . .

RUN apt-get -y update
RUN apt-get -y install wget
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get update -y
RUN apt-get install dotnet-sdk-3.1 -y
RUN apt-get install aspnetcore-runtime-3.1 -y
RUN apt-get install dotnet-runtime-3.1 -y

EXPOSE 5000

RUN dotnet build
 
CMD ["dotnet","run","MyWebApp.csproj"]

