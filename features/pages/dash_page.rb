    class DashPage < SitePrism::Page
        section :nav, Sections::NavBar, 'div[id=navbar]'
        element :welcome, '#title_row p'
    end