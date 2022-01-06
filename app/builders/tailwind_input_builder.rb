class TailwindInputBuilder < ActionView::Helpers::FormBuilder
  
    def text_field(attribute, options={})
        super(
            attribute, 
            options.reverse_merge(
                class: "rounded-lg border-transparent flex-1 appearance-none w-full border border-gray-300 py-2 px-4 bg-white text-gray-700 placeholder-gray-400 shadow-sm text-base focus:outline-none focus:ring-2 focus:ring-purple-600 focus:border-transparent my-2", 
                required: true
            )
        )
    end
  
    def url_field(attribute, options={})
        super(
            attribute, 
            options.reverse_merge(
                class: "rounded-lg border-transparent flex-1 appearance-none w-full border border-gray-300 py-2 px-4 bg-white text-gray-700 placeholder-gray-400 shadow-sm text-base focus:outline-none focus:ring-2 focus:ring-purple-600 focus:border-transparent my-2"
            )
        )
    end
  
    def text_area(attribute, options={})
        super(
            attribute, 
            options.reverse_merge(
                class: "flex-1 appearance-none border border-gray-300 w-full py-2 px-4 bg-white text-gray-700 placeholder-gray-400 rounded-lg text-base focus:outline-none focus:ring-2 focus:ring-purple-600 focus:border-transparent my-2"
            )
        )
    end
  
    def check_box(object_name, options={})
        super(object_name,options.reverse_merge(class: "h-6 w-6 border border-gray-300 rounded-lg ml-2"))
    end
  
    def date_field(object_name, method_name, options={})
        super(
            object_name, 
            options.reverse_merge(
                class: "appearance-none border border-gray-300 w-full py-2 px-4 bg-white text-gray-700 placeholder-gray-400 rounded-lg text-base focus:outline-none focus:ring-2 focus:ring-purple-600 focus:border-transparent flex-1 my-2", 
                required: true, 
                max: Date.today
            )
        )
    end
end