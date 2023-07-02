require "./modules/dbConnection.module.rb"

class Operations
    def initialize
        @connection = Connection.new
    end

    def insert(short_url, original_url)
        @connection.executeQuery(
            "INSERT INTO url_shortener.url_map VALUES ('#{short_url}', '#{original_url}')"
        )
    end

    def fetchByOriginalUrl(original_url)
        @result = @connection.executeQuery(
            "SELECT shortened_url FROM url_shortener.url_map WHERE original_url = '#{original_url}'"
        )        
        return extractUrl(@result, 'shortened_url')
    end

    def fetchByShortenedUrl(shortened_url)
        @result = @connection.executeQuery("
            SELECT original_url FROM url_shortener.url_map WHERE shortened_url = '#{shortened_url}'"
        )
        return extractUrl(@result, 'original_url')
    end

    def fetchLastEntry
        @connection.executeQuery(
            "SELECT * FROM url_shortener.url_map ORDER BY shortened_url DESC LIMIT 1"
        )
    end

    def getBasePath
        @base_path = extractUrl(fetchLastEntry, 'shortened_url')
        @base_path.slice! "https://short-url.com/"
        return @base_path
    end

    def extractUrl(result, param)
        @url = nil
        result.each do |row|
            @url = row[param]
            break
        end
        return @url
    end
end