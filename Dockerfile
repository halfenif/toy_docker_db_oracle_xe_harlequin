FROM container-registry.oracle.com/database/express:latest

USER root

# Timezone
RUN rm /etc/localtime
RUN ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime 
RUN echo Asia/Seoul > /etc/timezone

# Install Util
RUN yum install wget tar -y

# Install Oracle Instant Client
RUN wget https://yum.oracle.com/repo/OracleLinux/OL7/oracle/instantclient/x86_64/getPackage/oracle-instantclient19.23-basic-19.23.0.0.0-1.x86_64.rpm -O /tmp/oracle-instantclient19.23-basic-19.23.0.0.0-1.x86_64.rpm
RUN yum localinstall /tmp/oracle-instantclient19.23-basic-19.23.0.0.0-1.x86_64.rpm -y
RUN rm /tmp/oracle-instantclient19.23-basic-19.23.0.0.0-1.x86_64.rpm
RUN wget https://yum.oracle.com/repo/OracleLinux/OL7/oracle/instantclient/x86_64/getPackage/oracle-instantclient19.23-odbc-19.23.0.0.0-1.x86_64.rpm -O /tmp/oracle-instantclient19.23-odbc-19.23.0.0.0-1.x86_64.rpm
RUN yum localinstall /tmp/oracle-instantclient19.23-odbc-19.23.0.0.0-1.x86_64.rpm -y
RUN rm /tmp/oracle-instantclient19.23-odbc-19.23.0.0.0-1.x86_64.rpm

# Check Installed Path
# ex) /usr/lib/oracle/19.23/client64
COPY ./unixODBC/odbcinst.ini /etc/odbcinst.ini
#https://github.com/mkleehammer/pyodbc/wiki/Connecting-to-Oracle-from-RHEL-or-Centos


# Install Python 3.9
# Python을 upgrade하고나서는 yum명령이 정상적이지 않다.(주의!)
RUN yum install gcc openssl-devel bzip2-devel libffi-devel gzip make unixODBC.x86_64 -y
WORKDIR /opt
RUN wget https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tgz
RUN tar xzf Python-3.9.6.tgz
WORKDIR /opt/Python-3.9.6
RUN ./configure --enable-optimizations
RUN make altinstall
RUN rm -f /opt/Python-3.9.6.tgz
RUN rm /usr/bin/python
RUN ln -s /opt/Python-3.9.6/python /usr/bin/python

# Install harlequin
RUN python -m pip install harlequin-odbc

# Harlequin Script
RUN mkdir /app
COPY harlequin.sh /app


# init SQL
COPY init.sql /docker-entrypoint-initdb.d/

# Set Oracle
USER oracle
ENV  ORACLE_PWD manager

RUN echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/oracle/19.23/client64/lib' >> ~/.bashrc
