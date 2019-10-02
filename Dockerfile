FROM asciidoctor/docker-asciidoctor

# Must specify versions, see https://github.com/asciidoctor/asciidoctor-stylesheet-factory#setup-and-compilation.
ARG COMPASS_VERSION=0.12.7
ARG ZURB_FOUNDATION_VERSION=4.3.2

RUN \
  ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
  gem install asciidoctor-pdf-cjk rouge --no-ri --no-rdoc && \
  gem install --version ${COMPASS_VERSION} compass --no-ri --no-rdoc && \
  gem install --version ${ZURB_FOUNDATION_VERSION} zurb-foundation --no-ri --no-rdoc && \
  mkdir /fonts && \
  wget http://blueskis.wktk.so/AozoraMincho/archive/v0.1/aozoramincho-readme-ttf.zip -O /tmp/aozoramincho.zip && \
  unzip /tmp/aozoramincho.zip -d /fonts && \
  mkdir /fonts/genshingothic && \
  wget http://iij.dl.osdn.jp/users/8/8637/genshingothic-20150607.zip -O /tmp/genshingothic.zip && \
  unzip /tmp/genshingothic.zip -d /fonts/genshingothic && \
  wget https://github.com/edihbrandon/RictyDiminished/archive/master.zip -O /tmp/RictyDiminished.zip && \
  unzip /tmp/RictyDiminished.zip -d /fonts && \
  wget https://github.com/kuboaki/beauty-pdf-using-asciidoctor-pdf/archive/master.zip -O /tmp/beauty-pdf-using-asciidoctor-pdf.zip && \
  unzip /tmp/beauty-pdf-using-asciidoctor-pdf.zip -d /opt && \
  mkdir /styles && \
  ln -s /opt/beauty-pdf-using-asciidoctor-pdf-master/theme/mystyle-theme.yml /styles/pdf-style-theme.yml && \
  wget https://github.com/asciidoctor/asciidoctor-stylesheet-factory/archive/master.zip -O /tmp/asciidoctor-stylesheet-factory.zip && \
  unzip /tmp/asciidoctor-stylesheet-factory.zip -d /tmp && \
  cd /tmp/asciidoctor-stylesheet-factory-master && \
  compass compile && \
  cp -pr stylesheets / && \
  rm -rf /tmp/* /var/tmp/*

COPY Rakefile /root/

ENTRYPOINT ["rake", "-f", "/root/Rakefile"]
