#FROM microsoft/dotnet:2.1-sdk
#FROM microsoft/aspnetcore-build:2.1
#FROM microsoft/dotnet:2.1-aspnetcore-runtime

FROM microsoft/dotnet:2.1-sdk
COPY . /app
WORKDIR /app

RUN ["dotnet", "restore"]
RUN ["dotnet", "build"]

#RUN["apt-get","update"]
#RUN["apt-get","install, "lsof"]

ENV ASPNETCORE_ENVIRONMENT=Development
ENV ASPNETCORE_URLS=http://+:5001;http://+:5000
ENV CORECLR_PROFILER={57e1aa68-2229-41aa-9931-a6e93bbc64d8}
ENV CORECLR_ENABLE_PROFILING=1
ENV CORECLR_PROFILER_PATH=/root/.nuget/packages/appdynamics.agentsdk/4.5.1/runtimes/linux-x64/native/libappdprofiler.so

EXPOSE 5000/tcp
EXPOSE 5001/tcp

#ENTRYPOINT ["dotnet","run"]