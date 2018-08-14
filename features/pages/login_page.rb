class LoginPage < SitePrism::Page
    set_url '/login'
    element :email, '#email'
    element :password, 'input[placeholder="Informe sua senha"]'
    element :sign_in, 'button[id*=btnLogin]'
    element :errors, '#login-errors'

    def do_login(user, pwd)
        self.email.set user
        self.password.set pwd
        self.sign_in.click
    end
end