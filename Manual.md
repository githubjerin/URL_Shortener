To run :
-> bundle install
-> ruby server.rb

dependencies are in gemfile.

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