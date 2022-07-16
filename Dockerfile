FROM mediawiki:latest

ENV MW_HOME=/var/www/html

# download and add composer to path
RUN set -x; \
    php -r "readfile('https://getcomposer.org/installer');" | php \
    && mv composer.phar /usr/local/bin/composer

# get skins
RUN set -x; \
    cd $MW_HOME/skins \
    && git clone https://github.com/StarCitizenTools/mediawiki-skins-Citizen Citizen

# get extensions
RUN set -x; \
    cd $MW_HOME/extensions \
    && git clone --depth 1 https://gerrit.wikimedia.org/r/mediawiki/extensions/TemplateStyles

# install extensions
RUN set -x; \
    cd $MW_HOME/extensions/TemplateStyles \
    && composer install --no-dev


