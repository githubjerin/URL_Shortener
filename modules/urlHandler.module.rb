require "./modules/crudOperations.module.rb"

class UrlHandler
    @@base_url = "https://short-url.com/"
    @@base_path = nil

    def initialize
        @operation = Operations.new
        @@base_path = @operation.getBasePath.to_i
    end

    def get_shortend_url(original_url = nil)
        original_url = processUrl(original_url)
        if validateUrl original_url
            return "Please provide a valid URL"
        elsif original_url.include?("short-url.com")
            @short_url = @operation.fetchByShortenedUrl original_url
            if @short_url.nil?
                return "Cannot shorten URL with domain \"short-url.com\" and the URL does not exist"
            else
                return @short_url
            end
        else
            @existing_url = @operation.fetchByOriginalUrl original_url
            if @existing_url.nil?
                @short_url = shorten_url
                @operation.insert(@short_url, original_url)
                return @short_url
            else
                return @existing_url
            end
        end
    end

    def shorten_url
        @@base_path += 1
        return @@base_url + @@base_path.to_s
    end

    def validateUrl(original_url)
        if original_url.nil? || original_url.empty?
            return true
        elsif !original_url.start_with?("http://") && !original_url.start_with?("https://")
            return true
        elsif !original_url.include? "."
            return true
        else
            return false
        end
    end

    def processUrl(url)
        url = url.strip
        while url[-1, 1] == '/'
            url = url.chomp('/')
        end

        while url[-1, 1] == '\\'
            url = url.chomp('\\')
        end
        return url
    end
end