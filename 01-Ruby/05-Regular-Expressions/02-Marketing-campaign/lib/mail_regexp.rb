def valid?(email)
  # TODO: return true if the email is valid, false otherwise
  if email.match(/\A[\w+-.]+@[a-z-]+(\.[a-z-]+)*\.[a-z]+\z/i)
    return true
  else
    return false
  end
end

def clean_database(emails)
  # TODO: return an array with the valid emails only
  valid_emails = []
  i = 0

  while i < emails.length
    valid_emails << emails[i] if emails[i].match(/\A[\w+-.]+@[a-z-]+(\.[a-z-]+)*\.[a-z]+\z/i)
    i += 1
  end
  return valid_emails
end

#  <=better use.select
# emails.each do |email|
#   # do something with email
# end

# could use .split as well

def group_by_tld(emails)
  # TODO: return a Hash with emails grouped by TLD
  return emails.group_by { |e| e.partition(".").last }
end
# puts group_by_tld(["kevin@yahoo.fr", "edward@gmail.fr", "julien@mdn.com", "dimitri@berlin.de"])



def compose_mail(email)
  # TODO: return a Hash with username, domain and tld extracted from email
  username, domain_with_tld = email.split('@')
  domain, tld = domain_with_tld.split('.')

  new_hash = {
    username: username,
    domain: domain,
    tld: tld
  }
  return new_hash
end

puts compose_mail("seb@lewagon.fr")





LOCALES = {
  en: {
    subject: "Our website is online",
    body: "Come and visit us!",
    closing: "See you soon",
    signature: "The Team"
  },
  fr: {
    subject: "Notre site est en ligne",
    body: "Venez nous rendre visite !",
    closing: "A bientot",
    signature: "L'équipe"
  },
  de: {
    subject: "Unsere Website ist jetzt online",
    body: "Komm und besuche uns!",
    closing: "Bis bald",
    signature: "Das Team"
  }
}

def compose_translated_email(email)
  # TODO: return a Hash with username, domain and tld extracted from email
  # TODO: translate subject, body, closing and signature, according to TLD
  username, domain_with_tld = email.split('@')
  domain, tld = domain_with_tld.split('.')
  tldsym = tld.to_sym
  locale = LOCALES[tldsym] || LOCALES[:en]
  new_hash = {
    username: username, domain: domain, tld: tld,
    subject: locale[:subject], body: locale[:body], closing: locale[:closing], signature: locale[:signature]
  }
  return new_hash
end

puts compose_translated_email("seb@lewagon.de")
