FROM microsoft/dotnet:latest  
ENV LANG en_GB.UTF-8  
ENV LANGUAGE en_GB:en  
ENV LC_ALL en_GB.UTF-8
ENV ProjectName DockerDotNet
WORKDIR /tmp/$ProjectName/
COPY src/$ProjectName/project.json /tmp/$ProjectName/
RUN dotnet restore
COPY src/$ProjectName/. /tmp/$ProjectName/
RUN dotnet publish -c Release && \
    cp -ar /tmp/$ProjectName/bin/Release/netcoreapp1.0/publish/. /app/ && \
    rm -rf /tmp/$ProjectName/
EXPOSE 5000/tcp
WORKDIR /app/
ENTRYPOINT dotnet /app/$ProjectName.dll
