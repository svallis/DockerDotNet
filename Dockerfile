FROM microsoft/dotnet:latest
ENV ProjectName DockerDotNet
COPY . /tmp/$ProjectName/
RUN cd /tmp/$ProjectName/ && dotnet restore && \
    cd /tmp/$ProjectName/ && dotnet publish -c Release && \
    cp -ar /tmp/$ProjectName/bin/Release/netcoreapp1.0/publish/. /root/ && \
    rm -rf /tmp/$ProjectName/
EXPOSE 5000/tcp
ENTRYPOINT dotnet /root/$ProjectName.dll