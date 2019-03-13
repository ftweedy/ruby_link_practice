class HiloController < ApplicationController
    def try
        cookies.signed[:secret_num] = rand(100) if cookies.signed[:secret_num].blank? #target value
        @secret_num = cookies.signed[:secret_num].to_i

        cookies.signed[:tries] = 0 if cookies.signed[:tries].blank? #counter
        @tries = cookies.signed[:tries].to_i

        if params.has_key?(:num) && !params[:num].strip.empty?
            @num = params[:num].to_i
        end

        @result = "New:" if @result.blank?
        if (!@num.nil?)
            if (@num == @secret_num)
                @result = "Win!"
                cookies[:secret_num] = rand(100)
                @tries = 0
            elsif (@num > @secret_num)
                @result = "High"
                @tries += 1
            elsif (@num < @secret_num)
                @result = "Low"
                @tries += 1
            end
        end
        cookies.signed[:tries] = @tries
    end

    def reset
        cookies[:tries] = 0
        @tries = cookies[:tries]
        @result = "New:"
        cookies.signed[:secret_num] = rand(100)
        render "hilo/try.html.erb"
    end
end
