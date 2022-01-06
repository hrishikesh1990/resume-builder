module HomeHelper

    def concat_str_with_comma(*array_of_str)
        if array_of_str.nil? or array_of_str.length == 0
            return ""
        end
        sanitized_array = array_of_str.compact.split("").flatten # removes nil and ""
        sanitized_array.join(',')
    end

    def get_array_from_comma_separated_string(str)
        str.strip.split(',')
    end
end
