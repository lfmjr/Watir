Before('@login') do
    @login = LoginPage.new
    @login.load
    @login.do_login('kato.danzo@qaninja.io','secret')
end

After('@logout') do
    # fazer logout
    @dash.nav.do_logout
end