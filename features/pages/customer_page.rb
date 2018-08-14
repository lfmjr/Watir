class CustomerPage < SitePrism::Page
    set_url '/customers'

    section :nav, Sections::NavBar, 'div[id=navbar]'

    element :insert, 'button[id*=insert]'
    element :name, 'input[name=name]'
    element :phone, 'input[name=phone]'
    element :email, 'input[name=email]'
    element :gender_m, 'input[name=radio-m]'
    element :gender_f, 'input[name=radio-f]'
    element :type, 'select[id$=customer]'
    element :note, 'textarea[name=note]'
    element :promo, 'input[type=checkbox]'
    element :submit, 'button[id*=submit]'

    element :search_field, 'input[name=search]'
    element :search_button, 'button[id*=search]'

    element :grid_content, '#dataview-table tbody'
    elements :table_items, '#dataview-table tbody tr'

    def search(e)
        self.search_field.set e
        self.search_button.click
    end

    def save(customer)
        self.insert.click
        self.name.set customer['Nome']
        self.phone.set customer['Telefone']
        self.email.set customer['Email']
        self.gender_m.click if customer['Sexo'] == 'M'
        self.gender_f.click if customer['Sexo'] == 'F'
        self.type.find('option', text: customer['Tipo']).select_option
        self.note.set Faker::Lorem.paragraph        
        self.promo.click if customer['Promo'] == 'Sim'
        self.submit.click
    end
end