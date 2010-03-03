module James
  class Config
    def require(file, reload = false)
      James.libs[file] = reload
    end

    def port(value)
      port = value.to_i rescue 0
      Main.port = port if port > 0
    end
  end
end

