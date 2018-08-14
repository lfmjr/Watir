## Sections

module Sections
    class NavBar < SitePrism::Section
        element :usermenu, '#usermenu'
        element :logout, 'a[href$=logout]'
        
        def do_logout
            usermenu.click
            logout.click
        end
    end 
end