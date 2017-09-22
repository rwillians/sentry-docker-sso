FROM sentry:8.20
LABEL maintainer "Rafael Willians <rwmoraes@haoc.com.br>"

# Install sentry-auth-github and remove repo access requirement from plugin because auth doesn't need it and it's intrusive otherwise
RUN set -x \
	&& pip install https://github.com/getsentry/sentry-auth-github/archive/master.zip \
	&& sed -i 's/org,repo/org/g' /usr/local/lib/python2.7/site-packages/sentry_auth_github/constants.py

# Install sentry-auth-google
RUN pip install https://github.com/getsentry/sentry-auth-google/archive/master.zip
