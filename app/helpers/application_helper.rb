module ApplicationHelper
    def farenheit_to_celsius(farenheit)
        "#{(farenheit - 32) * 5 / 9}°C"
    end

    # def hero_banner
    #     styles = "display:flex;justify-content:center;min-height:500px;padding:1em;flex-direction:column;background-color:#eee;gap:1em;"
    #     content_tag(:header, style: styles) do
    #         yield
    #     end
    # end

    def hero_banner(&block)
        styles = "display:flex;justify-content:center;min-height:500px;padding:1em;flex-direction:column;background-color:#eee;gap:1em;"
        content_tag(:header, style: styles, &block)
    end
end
