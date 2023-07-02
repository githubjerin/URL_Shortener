To run :
-> bundle install
-> ruby server.rb

dependencies are in gemfile.

SETUP:
a .env file should contain
    1. HOST [hostname of mysql server (default: localhost)]
    2. DB_USERNAME [username to connect to mysql server]
    3. DB_PASSWORD [password to connect to mysql server]

ENDPOINTS:

1. [POST] /:
{
    "url": ""
}

2. [GET] /

URL VALIDATION:
1. Should not be empty
2. Should start with "http://" or "https://"
3. Should contain "."

EXPECTED OUTPUTS: [input => output]
1. short url => original url if exists else empty string
2. original url => short url

INPUT | OUTPUT FORMAT: JSON