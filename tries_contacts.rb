def save_contact(contacts, contact)
    i = 1
    value = save_letter(contact[0], contact, contacts);
    while i < contact.length
        value = save_letter(contact[i], contact, value)
        i += 1
    end
end

def save_letter(letter, value, contacts = nil)
    contacts[letter] = {} if contacts[letter].nil?
    contacts[letter]['values'] = [] if contacts[letter]['values'].nil?
    contacts[letter]['values'] << value
    return contacts[letter]
end

def find_contacts(contacts, contact)
    value = find_letter(contact[0], contacts)
    return nil if value.nil?
    i = 1
    while i < contact.length 
        result = find_letter(contact[i], value)
        if result.nil?
            return nil
        else
            value = result
            i += 1
        end
    end
    value 
end

def find_letter(letter, value)
    if value[letter] != nil
        value[letter]
    end
end

n = gets.strip.to_i
contacts = {}
for a0 in (0..n-1)
    op,contact = gets.strip.split(' ')
    save_contact(contacts,contact) if op == 'add'
    if op == 'find'
        result = find_contacts(contacts, contact) 
        p result.nil? ? 0 : result['values'].length
    end
end