class WhateversController < ApplicationController
    def what
        render :text => "What do you want me to say???"
    end

    def times
        if session.key?("times")
            session[:times]+=1
        else
            session[:times]=1
        end
        render :text => "You visited this url #{session[:times]} times"
    end

    def restart
        session.clear
        render :text => "Destroyed the session!"
    end

    def hello
        render :text => "hello"
    end

    def sayingHello
        if params[:name] == "Michael"
            redirect_to "/say/hello/Joe"
        else
            render :text => "saying hello #{params[:name]}"
        end
    end
end
